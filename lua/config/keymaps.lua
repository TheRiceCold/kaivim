vim.g.mapleader = ' '
local map = vim.keymap.set

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = "Go to left window", remap = true })
map('n', '<C-j>', '<C-w>j', { desc = "Go to lower window", remap = true })
map('n', '<C-k>', '<C-w>k', { desc = "Go to upper window", remap = true })
map('n', '<C-l>', '<C-w>l', { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', ':resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<cr>', { desc = 'Increase window width' })

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==<cr>', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<A-j>', "<cmd>m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', '<A-k>', "<cmd>m '<-2<cr>gv=gv", { desc = 'Move up' })

-- Buffers
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })

-- Clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

map({ 'n', 'v' }, '<leader>q', ':q!<cr>', { desc = 'Quit buffer' })
