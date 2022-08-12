local bind = vim.keymap.set

vim.g.mapleader = ","

bind('n', '<leader>v', '<cmd>vsp<cr><C-w>l', {desc = 'Vertical split'})
bind('n', '<leader>e', '<cmd>e .<cr>', {desc = 'Netrw file manager'})

-- Buffer navigation
bind('n', '<M-l>', '<cmd>bp<cr>', {desc = 'Buffer previous'})
bind('n', '<M-h>', '<cmd>bn<cr>', {desc = 'Buffer next'})
bind('n', '<M-Down>', '<cmd>bd<cr><cmd>vsp<cr>', {desc = 'Buffer close'})
