-- remap window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h',{noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w>j',{noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k',{noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l',{noremap = true})

-- use Tab to switch buffers
vim.keymap.set('n', '<tab>', ':bn<CR>',{noremap = true})
vim.keymap.set('n', '<S-tab>', ':bp<CR>',{noremap = true})
vim.keymap.set('n', '<leader>x', ':BufferClose<CR>',{noremap = true, desc = "Close current tab/buffer"})

-- save
vim.keymap.set('n', '<leader>fs', ':w<CR>',{noremap = true, desc = "Save current tab/buffer"})

-- indent buffer
vim.keymap.set('n', '<leader>fi', 'gg=G',{noremap = true, desc = "Indent current tab/buffer"})
