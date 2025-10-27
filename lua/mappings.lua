require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map({ "n", "i", "v" }, "<C-q>", "<cmd> w <cr>")

-- Split windows
map("n", "|", ":vsplit<CR>")
map("n", "-", ":split<CR>")

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Keymaps for switching windows
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>")

-- Term
map("t", "<Esc>", "<C-\\><C-n>")

-- Clear search highlight
map({ "n", "v" }, ",<space>", ":nohlsearch<CR>", { noremap = true })

-- File bar
-- map("n", "<C-b>", "<cmd>NvimTreeToggle<CR>")
