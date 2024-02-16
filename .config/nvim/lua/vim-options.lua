vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2 
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.g.mapleader = " "
--
-- remap window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h',{noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w>j',{noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k',{noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l',{noremap = true})

