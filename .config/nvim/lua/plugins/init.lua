return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "python", "c", "cpp", "hyprlang",
        "markdown", "markdown_inline", "latex", "regex"
  		},
  	},
  },
  {
    "epwalsh/obsidian.nvim",
     version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
       dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
      -- see below for full list of optional dependencies 👇

    opts = require "configs.obsidian"

  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    ft = "markdown",
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = require "configs.render-markdown",
  },
  {
    "jbyuki/nabla.nvim",
    ft = {"markdown", "latex"},
    config = function ()
      require("nabla").enable_virt()
    end,
  },
  -- { 'ryleelyman/latex.nvim', opts = {} , ft = {"markdown"}},
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require "configs.noice",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = require "configs.nvim-notify",
  },
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = require "configs.presence",
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = require "configs.snacks"
},
  {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>cx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>cX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>cL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>cQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
},
  -- {
  --   "gelguy/wilder.nvim",
  --   event = "VeryLazy",
  --   opts = {modes = {':', '/', '?'}},
  --   dependencies = {"roxma/nvim-yarp"},
 { "ray-x/lsp_signature.nvim", enabled = false },
}
