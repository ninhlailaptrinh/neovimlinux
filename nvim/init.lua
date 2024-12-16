-- Bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Disable man pages plugin if you don't need it
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1

-- Load các module cấu hình
require('plugins')
require('plugins.options')
require('plugins.keymaps')
require('config.lsp')
require('config.cmp')
require('config.git')
require('config.bufferline')
require('config.null-ls')
require('config.diagnostic')
require('config.trouble')
require('config.indent-blankline')
require('config.liveserver')
require('config.treesitter')
require('config.mason')
require('config.lualine')
require('config.telescope')
require('config.autopairs')
require('config.nvim-tree')
require('config.gitsigns')
require('config.comment')
require('config.colorizer')

