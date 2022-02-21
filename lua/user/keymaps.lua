local opts = {noremap = true, silent = true}

local term_opts = {silent = true}

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 15<cr>", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("i", "ii", "<Esc>", opts)
keymap("i", "II", "<Esc>", opts)
keymap("v", "ii", "<Esc>", opts)
keymap("v", "II", "<Esc>", opts)

keymap("v", "p", '"_dP', opts)

keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

keymap("n", "<leader>tg", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>tn", ":lua _NODE_TOGGLE()<CR>", opts)
keymap("n", "<leader>tp", ":lua _PYTHON_TOGGLE()<CR>", opts)
