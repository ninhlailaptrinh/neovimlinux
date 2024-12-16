require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git"
    },
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      }
    }
  }
})
