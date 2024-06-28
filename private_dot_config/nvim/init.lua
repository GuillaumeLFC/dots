require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
local parsers = require "nvim-treesitter.parsers"

local parser_config = parsers.get_parser_configs()
parser_config.jsonc.filetype_to_parsername = "json"

require'lspconfig'.tsserver.setup{}

require("luasnip").config.set_config({ -- Setting LuaSnip config

  enable_autosnippets = true,

  store_selection_keys = "<Tab>",
})

require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/md.lua"})

vim.cmd([[ 
imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'

" Jump forward in through tabstops in insert and visual mode with Control-f
imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'

]])

-- require("rose-pine").setup({
--     variant = "moon", -- auto, main, moon, or dawn
--     dark_variant = "moon", -- main, moon, or dawn
--     dim_inactive_windows = false,
--     extend_background_behind_borders = true,
--
--     enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--     },
--
--     styles = {
--         bold = true,
--         italic = false,
--         transparency = false,
--     },
--
--     groups = {
--         border = "muted",
--         link = "iris",
--         panel = "surface",
--
--         error = "love",
--         hint = "iris",
--         info = "foam",
--         note = "pine",
--         todo = "rose",
--         warn = "gold",
--
--         git_add = "foam",
--         git_change = "rose",
--         git_delete = "love",
--         git_dirty = "rose",
--         git_ignore = "muted",
--         git_merge = "iris",
--         git_rename = "pine",
--         git_stage = "iris",
--         git_text = "rose",
--         git_untracked = "subtle",
--
--         h1 = "iris",
--         h2 = "foam",
--         h3 = "rose",
--         h4 = "gold",
--         h5 = "pine",
--         h6 = "foam",
--     },
--
--     highlight_groups = {
--         -- Comment = { fg = "foam" },
--         -- VertSplit = { fg = "muted", bg = "muted" },
--     },
--
--     before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         -- if highlight.undercurl then
--         --     highlight.undercurl = false
--         -- end
--         --
--         -- Change palette colour
--         -- if highlight.fg == palette.pine then
--         --     highlight.fg = palette.foam
--         -- end
--     end,
-- })
--
vim.o.termguicolors = true
-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
--
-- require("lazy").setup({
--     {
--         "kdheepak/lazygit.nvim",
--     	cmd = {
--     		"LazyGit",
--     		"LazyGitConfig",
--     		"LazyGitCurrentFile",
--     		"LazyGitFilter",
--     		"LazyGitFilterCurrentFile",
--     	},
--         -- optional for floating window border decoration
--         dependencies = {
--             "nvim-lua/plenary.nvim",
--         },
--         -- setting the keybinding for LazyGit with 'keys' is recommended in
--         -- order to load the plugin when the command is run for the first time
--         keys = {
--            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
--         }
--     },
-- })
--
--
--
--
-- --
-- -- The setup config table shows all available config options with their default values:
-- --
-- require("presence").setup({
--     -- General options
--     auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
--     neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
--     main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
--     -- client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
--     log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
--     debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
--     enable_line_number  = false,                      -- Displays the current line number instead of the current project
--     blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
--     buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
--     file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
--     show_time           = true,                       -- Show the timer
--
--     -- Rich Presence text options
--     editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
--     file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
--     git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
--     plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
--     reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
--     workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
--     line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
-- })
--
