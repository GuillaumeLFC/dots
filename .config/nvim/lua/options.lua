require "nvchad.options"

-- add yours here!

local o = vim.o
o.termguicolors = true
vim.notify = require("notify")
o.relativenumber = true
o.linebreak = true
o.breakindent = true
o.wrap = true
o.conceallevel = 1
-- o.cursorlineopt ='both' -- to enable cursorline!
