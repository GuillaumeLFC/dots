local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rose-pine/neovim", name = "rose-pine"
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "andweeb/presence.nvim",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "lua-language-server",
        "js-debug-adapter",
        "eslint-lsp",
        "markdownlint",
        "typescript-language-server",
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "cpp",
        "hyprlang",
        "typescript",
      },
     },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { url = "https://github.com/L3MON4D3/LuaSnip.git" },
  {
    "kdheepak/lazygit.nvim",
  },
  -- {
  --   "GuillaumeLFC/null-ls.nvim",
  --   events = "VeryLazy",
  --   opts = function ()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-dap",
    config = function ()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
}
return plugins
