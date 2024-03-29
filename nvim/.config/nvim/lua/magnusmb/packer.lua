-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    -- or                            , branch = '0.1.x',
    requires = { "nvim-lua/plenary.nvim", "ahmedkhalf/project.nvim" },
  })

  use({ "rmehri01/onenord.nvim",
    config = function()
      vim.cmd([[colorscheme onenord]])
    end
  })

  use({ "goolord/alpha-nvim" })
  use({ "folke/which-key.nvim" })
  use({ "tpope/vim-fugitive" })
  use({ "tpope/vim-surround" })
  use({ "nvim-treesitter/nvim-treesitter" }, { run = ":TSUpdate" })

  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  })

  use({ 'jose-elias-alvarez/null-ls.nvim', requires = { { 'nvim-lua/plenary.nvim' } } })

  use({ 'numToStr/Comment.nvim' })
  use({ 'JoosepAlviste/nvim-ts-context-commentstring' })
end)
