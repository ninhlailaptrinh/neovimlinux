local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- JavaScript/TypeScript/Frontend
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "yaml",
        "markdown",
        "css",
        "scss",
        "html"
      },
    }),
    
    -- Thay eslint_d bằng eslint thông thường
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    
    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    
    -- C/C++
    null_ls.builtins.formatting.clang_format,
    
    -- JSON
    null_ls.builtins.diagnostics.jsonlint,
  },
}) 