vim.g.mapleader = " "

vim.keymap.set("n", "<leader><leader>", ":silent!nohls<CR>")

-- #### NORMAL MODE ####
-- vertical navigation
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- vimkey pane movements
vim.keymap.set("n", "<leader>j", "<C-W><C-J>")
vim.keymap.set("n", "<leader>k", "<C-W><C-K>")
vim.keymap.set("n", "<leader>h", "<C-W><C-H>")
vim.keymap.set("n", "<leader>l", "<C-W><C-L>")

-- write and quit
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":qa<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":wq<CR>")

-- format json
vim.keymap.set("n", "<leader>fj", ":%!jq .<CR>")

-- #### VISUAL MODE ####
-- copy to clipboard
vim.keymap.set("v", "<C-y>", '"+y')

-- base 64 encoding decoding
vim.keymap.set("v", "<leader>be", "c<c-r>=system('base64', @\")<cr><esc>kJ")
vim.keymap.set("v", "<leader>bd", "c<c-r>=system('base64 --decode', @\")<cr><esc>")

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
