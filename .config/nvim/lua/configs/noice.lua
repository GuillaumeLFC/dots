return {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = true,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },
  -- Avoir les completions sous l'invte de commande
  views = {
    cmdline_popup = {
      position = {
        row = 5,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
      filter_options = {},
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 8,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
  -- Ne pas avoir les messages buffer écrit 
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "lsp",
        kind = "progress",
        cond = function(message)
          local client = vim.tbl_get(message.opts, "progress", "client")
          return client == "lua_ls"
        end,
      },
      opts = { skip = true },
    },
    {
        view = "cmdline",
        filter = { event = "msg_showmode" },
      },
  },
  -- Recording messages 
  -- sections = {
  --   lualine_x = {
  --     {
  --       require("noice").api.statusline.mode.get,
  --       cond = require("noice").api.statusline.mode.has,
  --       color = { fg = "#ff9e64" },
  --     }
  --   },
  -- },
}
