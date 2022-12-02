vim.g.mapleader = ";"

local keymap = vim.keymap

-- quit
keymap.set("n", "<leader>q", "<Cmd>q<CR>")
-- write
keymap.set("n", "<leader>w", "<Cmd>w<CR>")
-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- split window
keymap.set("n", "<leader>ss", ":vsplit<Return><C-w>w", {silent = true})
-- move cursor between window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
-- cursor move
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("n", "<Space>", "i<Space><Esc>")
keymap.set("n", "<CR>", "i<CR><Esc>")
