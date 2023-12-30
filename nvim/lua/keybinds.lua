local bind = vim.keymap.set

vim.g.mapleader = ","

bind('n', '<leader>v', '<cmd>vsp<cr><C-w>l', {desc = 'Vertical split'})
bind('n', '<leader>e', '<cmd>e .<cr><cmd>set relativenumber<cr>', {desc = 'Netrw file manager'})

-- Buffer navigation
bind('n', '<M-l>', '<cmd>bp<cr>', {desc = 'Buffer previous'})
bind('n', '<M-h>', '<cmd>bn<cr>', {desc = 'Buffer next'})
bind('n', '<M-Down>', '<cmd>CloseOpenBuff<cr>', {desc = 'Buffer close'})

-- Buffer resize
bind('n', '<leader>+', '<cmd>vertical resize +5<cr>', {desc = 'Buffer increase size'})
bind('n', '<leader>-', '<cmd>vertical resize -5<cr>', {desc = 'Buffer decrease size'})

-- Tab movements
bind('n', '<C-M-n>', '<cmd>tabnew<cr>', {desc = 'New tab'})
bind('n', '<C-M-Down>', '<cmd>tabclose<cr>', {desc = 'Close tab'})
bind('n', '<C-M-l>', '<cmd>tabnext<cr>', {desc = 'Next tab'})
bind('n', '<C-M-h>', '<cmd>tabprevious<cr>', {desc = 'Previous tab'})

-- Movements into buffer
bind('n', "<C-d>", "<C-d>zz")
bind('n', "<C-u>", "<C-u>zz")

-- Move lines in visual mode
bind('v', 'J', ":m '>+1<cr>gv=gv")
bind('v', 'K', ":m '<-2<cr>gv=gv")

-- Text cleaning
bind('n', '<leader>w', '<cmd>%s/\\s\\+$/<cr><cmd>nohlsearch<cr>', {desc = 'Delete white spaces at end of each line'})

-- Telescope
bind('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
bind('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
bind('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
bind('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
