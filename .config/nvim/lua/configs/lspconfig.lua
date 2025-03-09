-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "gradle_ls","dockerls", "pyright",}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.docker_compose_language_service.setup{}
lspconfig.jdtls.setup{cmd = {'jdtls'} } --yay -S jdtls

lspconfig.textlsp.setup{
  analysers = {
    ollama = {
          enabled = true,
          check_text = {
            on_open = false,
            on_save = true,
            on_change = true,
          },
          model = "phi3:3.8b-instruct",  -- smaller but faster model
          -- model = "phi3:14b-instruct",  -- more accurate
          max_token = 50,
        },
  }

}

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
        modifyLineBreaks = true
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
