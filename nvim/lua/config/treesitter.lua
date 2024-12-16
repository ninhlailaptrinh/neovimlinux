require('nvim-treesitter.configs').setup({
  -- Cài đặt các parser cho ngôn ngữ
  ensure_installed = {
    "lua",
    "vim",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "python",
    "markdown",
    "c",
    "cpp",
  },

  -- Cài đặt tự động khi gặp file mới
  auto_install = true,

  -- Highlight cú pháp
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Tự động indent
  indent = {
    enable = true
  },

  -- Rainbow parentheses
  rainbow = {
    enable = true,
    extended_mode = true,
  },

  -- Tự động thêm cặp dấu đóng mở
  autopairs = {
    enable = true
  },
}) 