-- Phím tắt cho Fugitive
vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
vim.keymap.set('n', '<leader>ga', '<cmd>Git add .<cr>', { desc = 'Git add all' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { desc = 'Git push' })

-- Phím tắt cho LazyGit
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' }) 