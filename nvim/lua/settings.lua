-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.conceallevel = 0

vim.opt.ignorecase = true
vim.opt.smartindent = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- File format
vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"

-- Long lines wrapping
vim.opt.wrap = true

-- Mute error sound
vim.opt.belloff = "all"

-- Windows split positions
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Write temp file in tmp folder
vim.opt.backupdir = "/tmp//"
vim.opt.directory = "/tmp//"
vim.opt.undodir = "/tmp//"

-- Cl size
vim.opt.cmdheight = 2

-- Connection with s.o. clipboard
vim.opt.clipboard = "unnamedplus"

P = function(value)
  print(vim.inspect(value))
end

-- Lua indentation
vim.cmd([[
  autocmd FileType lua setlocal
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
]])
