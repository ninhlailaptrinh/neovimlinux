local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Tạo on_attach function chung
local on_attach = function(client, bufnr)
    -- Các phím tắt LSP
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
end

-- Cấu hình chung cho tất cả LSP servers
local default_config = {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Cấu hình Mason để quản lý LSP servers
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",        -- C/C++
        "pyright",       -- Python
        "html",          -- HTML
        "cssls",         -- CSS
        "lua_ls",
        "typescript-language-server",
        "eslint",
    },
    automatic_installation = true,
})

-- C/C++
lspconfig.clangd.setup(vim.tbl_deep_extend("force", default_config, {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--query-driver=/usr/bin/gcc,/usr/bin/g++",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    init_options = {
        compilationDatabasePath = "build",
        fallbackFlags = {
            "-std=c11",
            "-I/usr/include",
            "-I/usr/local/include",
            "-I/usr/lib/gcc/x86_64-pc-linux-gnu/13.2.1/include",
            "-I/usr/include/c++/13.2.1",
            "-I/usr/include/c++/13.2.1/x86_64-pc-linux-gnu"
        }
    }
}))

-- Python
lspconfig.pyright.setup({
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace"
            }
        }
    }
})

-- HTML
lspconfig.html.setup({
    capabilities = capabilities,
    filetypes = { "html" },
    init_options = {
        configurationSection = { "html", "css", "javascript", "typescript", "tsx", "ts" },
        embeddedLanguages = {
            css = true,
            javascript = true
        }
    }
})

-- CSS
lspconfig.cssls.setup({
    capabilities = capabilities,
    settings = {
        css = {
            validate = true,
            lint = {
                unknownAtRules = "ignore"
            }
        }
    }
})

-- JavaScript/TypeScript
lspconfig.ts_ls.setup({
    capabilities = capabilities,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
            },
            suggest = {
                completeFunctionCalls = true,
            }
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayVariableTypeHints = true,
            },
            suggest = {
                completeFunctionCalls = true,
            }
        }
    },
    -- Hỗ trợ React
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "tsx", "ts" },
})

-- Lua
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

-- ESLint (cấu hình mới)
lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
    end,
    capabilities = capabilities,
    filetypes = { 
        "javascript", 
        "javascriptreact", 
        "typescript", 
        "typescriptreact",
        "tsx",
        "ts"
    },
    settings = {
        workingDirectory = { mode = "auto" },
        format = { enable = true },
        lint = { enable = true },
        codeAction = { disableRuleComment = { enable = true } },
        experimental = { useFlatConfig = false }
    }
})

-- Thay thế autocommand cũ bằng function an toàn hơn
local function eslint_fix_file()
    -- Kiểm tra xem buffer hiện tại có phải là file được hỗ trợ không
    local file_type = vim.bo.filetype
    local supported_file_types = {
        javascript = true,
        javascriptreact = true,
        typescript = true,
        typescriptreact = true,
        tsx = true,
        ts = true
    }

    if supported_file_types[file_type] then
        -- Kiểm tra xem ESLint có được cài đặt không
        if vim.fn.executable('eslint') == 1 then
            -- Kiểm tra xem có file cấu hình ESLint trong dự án không
            local eslint_config = vim.fn.findfile('.eslintrc.js', '.;')
            local eslint_config_json = vim.fn.findfile('.eslintrc.json', '.;')
            
            if eslint_config ~= '' or eslint_config_json ~= '' then
                local ok, err = pcall(function()
                    vim.cmd('silent! EslintFixAll')
                end)
                
                if not ok then
                    vim.notify("ESLint fix failed: " .. tostring(err), vim.log.levels.WARN)
                end
            else
                vim.notify("No ESLint config found in project", vim.log.levels.WARN)
            end
        else
            vim.notify("ESLint is not installed", vim.log.levels.WARN)
        end
    end
end

-- Đăng ký autocommand mới
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.c", "*.cpp", "*.h", "*.hpp" },
    callback = function()
        eslint_fix_file()
    end,
})

-- Thêm command để có thể gọi thủ công
vim.api.nvim_create_user_command('EslintFix', function()
    eslint_fix_file()
end, {})
-- Thay tsserver bằng typescript-language-server
lspconfig.tsserver.setup(vim.tbl_deep_extend("force", default_config, {
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { 
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    }
}))
