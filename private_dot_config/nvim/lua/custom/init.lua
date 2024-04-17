vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.lsp.set_log_level("debug")
