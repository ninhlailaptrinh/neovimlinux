return require('packer').startup(function(use)
  -- Packer có thể tự quản lý
  use 'wbthomason/packer.nvim'
  
  -- Theme
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('config.onedark')
    end
  }
  
  -- Status line đẹp
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.lualine')
    end
  }
  
  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.nvim-tree')
    end
  }
  
  -- Telescope - Công cụ tìm kiếm mạnh mẽ
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.telescope') 
    end
  }
  
  -- Indent guides - Hiển thị đường dẫn thụt lề
  use {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require('config.indent-blankline')
    end
  }
  
  -- Tự động đóng cặp ngoặc
  use {
    "windwp/nvim-autopairs",
    config = function()
      require('config.autopairs')
    end
  }
  
  -- Terminal nổi trong Neovim
  use {
    'voldikss/vim-floaterm',
    config = function()
      require('config.floaterm')
    end
  }
  
  -- LSP & Mason - Quản lý và cài đặt LSP servers
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'folke/neodev.nvim', -- Thêm LSP cho Lua/Neovim API
  }
  
  -- Completion - Gợi ý code tự động
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
    }
  }
  
  -- Snippets - Các đoạn code mẫu
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      'rafamadriz/friendly-snippets'
    }
  }
  
  -- UI cho LSP - Làm đẹp giao diện LSP
  use {
    'onsails/lspkind.nvim',
    'folke/lsp-colors.nvim',
    'glepnir/lspsaga.nvim',
  }
  
  -- Git integration - Hiển thị thay đổi git trong editor
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
    end
  }
  
  -- Git plugins
  use {
    'tpope/vim-fugitive',  -- Git commands
    config = function()
      require('config.git')
    end
  }

  use {
    'kdheepak/lazygit.nvim',  -- LazyGit integration
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  
  -- Syntax highlighting nâng cao
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end
  }
  
  -- Plugin comment code dễ dàng
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('config.comment')
    end
  }
  
  -- Hiển thị phím tắt
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }
  
  -- Quản lý buffer với giao diện tab
  use {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup()
    end
  }
  
  -- Formatting và linting
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.null-ls")
    end
  }
  
  -- Hiển thị lỗi và cảnh báo
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require('config.trouble')
    end
  }
  
  -- Auto rename tag
  use {
    'AndrewRadev/tagalong.vim',
    config = function()
      vim.g.tagalong_verbose = 0
    end
  }
  
  -- Color highlighter
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('config.colorizer')
    end
  }
  
  -- React và NodeJS support
  use {
    -- Syntax highlighting cho JSX/TSX
    'MaxMEllon/vim-jsx-pretty',
  }
  
  -- Snippets cho React/JavaScript
  use {
    "dsznajder/vscode-react-javascript-snippets",
    build = "yarn install --frozen-lockfile && yarn compile"
  }
  
  -- Styled Components support
  use {
    'styled-components/vim-styled-components',
    branch = 'main'
  }
  
  -- Debugging support
  use {
    'mfussenegger/nvim-dap',
    requires = {
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'jay-babu/mason-nvim-dap.nvim',
    }
  }
  
  -- Thêm vào phần plugins
  use 'tpope/vim-surround'  -- Thao tác với surrounding characters
  use 'mg979/vim-visual-multi' -- Multiple cursors
  
  -- Neotest cho testing
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "nvim-neotest/nvim-nio", -- Thêm dependency nvim-nio
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.js",
          }),
        },
      })
    end,
  }

  -- Thêm các plugin khác vô đây !
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)
