require("bufferline").setup({
  options = {
    numbers = "none",
    diagnostics = "nvim_lsp",
    separator_style = "thin",
    show_tab_indicators = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
})

-- Phím tắt chuyển buffer
vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>')
vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>')
vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>')
vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>') 