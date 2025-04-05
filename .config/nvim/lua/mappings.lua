require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<D-lt>", "<")
map("i", "<D->>", ">")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map({"i", "n", "v"}, "<Left>", "<Nop>")
map({"i", "n", "v"}, "<Right>", "<Nop>")
map({"i", "n", "v"}, "<Down>", "<Nop>")
map({"i", "n", "v"}, "<Up>", "<Nop>")

local nomap = vim.keymap.del
 -- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", "<Nop>")
