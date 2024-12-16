require('onedark').setup {
  style = 'deep',
  transparent = true,
  term_colors = true,
  highlights = {
    CursorLine = { bg = 'none', fg = 'none', sp = 'none' },
    CursorLineNr = { bg = 'none', fg = '#abb2bf' }
  }
}
require('onedark').load()

vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', {})
