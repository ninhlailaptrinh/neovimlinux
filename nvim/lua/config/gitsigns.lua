require('gitsigns').setup({
  -- Các dấu hiệu thay đổi git trong signcolumn
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },

  -- Cấu hình cơ bản
  signcolumn = true,  -- Hiển thị dấu trong signcolumn
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  
  -- Phím tắt cần thiết
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Utility để map phím
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Di chuyển giữa các thay đổi
    map('n', ']c', gs.next_hunk)
    map('n', '[c', gs.prev_hunk)

    -- Các thao tác với git
    map('n', '<leader>hs', gs.stage_hunk)      -- Stage thay đổi
    map('n', '<leader>hr', gs.reset_hunk)      -- Reset thay đổi
    map('n', '<leader>hp', gs.preview_hunk)    -- Xem thay đổi
    map('n', '<leader>hb', gs.blame_line)      -- Xem blame
    map('n', '<leader>hd', gs.diffthis)        -- Xem diff
  end
}) 