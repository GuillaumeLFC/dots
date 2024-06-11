---@type ChadrcConfig
local M = {}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
M.ui = {
  tabufline = {
    enabled= false
  }
}
return M
