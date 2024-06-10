vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
vim.wo.relativenumber = true
vim.lsp.set_log_level("debug")
