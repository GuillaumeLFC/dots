local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null_ls")

local opts = {
  sources = {
    null_ls.builtins.diagnostics.eslint,
  },
  on_attach = function (client, bufnr)
    if client.support_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_clear_autocmds("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({bufnr = bufnr})
        end,
      })
    end
  end
}

return opts