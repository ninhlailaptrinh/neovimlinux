require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",          -- TypeScript/JavaScript
    "html",              -- HTML
    "cssls",            -- CSS
    "pyright",          -- Python
    "tailwindcss",      -- Tailwind CSS
    "emmet_ls",         -- Emmet
    "jsonls",           -- JSON
    "clangd",          -- C/C++
    "lua_ls",          -- Lua
    "eslint",          -- ESLint
    "volar",           -- Vue
    "astro",           -- Astro
    "prismals",        -- Prisma
  }
})