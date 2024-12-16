local keymap = vim.keymap

-- Leader key
vim.g.mapleader = "\\"

-- Telescope
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')

-- NvimTree
keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

-- Window navigation
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- Floaterm
vim.keymap.set('n', '<leader>ft', ':FloatermToggle<CR>', { silent = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:FloatermToggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>fn', ':FloatermNew<CR>', { silent = true })
vim.keymap.set('n', '<leader>fp', ':FloatermPrev<CR>', { silent = true })
vim.keymap.set('n', '<leader>fk', ':FloatermKill<CR>', { silent = true })

local keymap = vim.keymap.set

-- LSP
keymap('n', 'gd', vim.lsp.buf.definition)
keymap('n', 'gr', vim.lsp.buf.references)
keymap('n', 'gi', vim.lsp.buf.implementation)
keymap('n', 'K', vim.lsp.buf.hover)
keymap('n', '<leader>rn', vim.lsp.buf.rename)
keymap('n', '<leader>ca', vim.lsp.buf.code_action)
keymap('n', '<leader>fm', vim.lsp.buf.format)

-- Diagnostics
keymap('n', '<leader>d', vim.diagnostic.open_float)
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)

-- Testing
vim.keymap.set('n', '<leader>tt', function() require("neotest").run.run() end, { desc = "Run nearest test" })
vim.keymap.set('n', '<leader>tf', function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run current file" })
vim.keymap.set('n', '<leader>ts', function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })