local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- List of your plugins
  "tanvirtin/monokai.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- Vscode-like file browser
  {
	  "nvim-tree/nvim-tree.lua",
	  config = function()
		  require("nvim-tree").setup()
	end,
  },

  -- Vscode-like pictograms
  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },

  -- Auto-completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",   -- Correct reference to lspkind.nvim
      "hrsh7th/cmp-nvim-lsp",   -- LSP auto-completion
      "hrsh7th/cmp-buffer",     -- Buffer auto-completion
      "hrsh7th/cmp-path",       -- Path auto-completion
      "hrsh7th/cmp-cmdline",    -- Cmdline auto-completion
    },
    config = function()
      require("config.nvim-cmp")
    end,
  },

  -- Code snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
  },

  -- Auto-pairs plugin
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
})

