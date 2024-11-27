-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "gradle_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.jdtls.setup{cmd = {'jdtls'} } --yay -S jdtls

lspconfig.texlab.setup{
  cmd = {"texlab"},
  settings = {
    texlab = {
      auxDirectory = "./aux/",
      bibtexFormatter = "texlab",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-g", "%f" },
        executable = "latexmk",
        forwardSearchAfter = false,
        onSave = true,
      },
      chktex = {
        onEdit = true,
        onOpenAndSave = true,
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        args = {}
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = false
      }
    }
  },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
