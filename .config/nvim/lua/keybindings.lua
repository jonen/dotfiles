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

-- quit
vim.keymap.set('n', '<leader>qq', ':qa<CR>',{noremap = true, desc = "Quit nvim"})
vim.keymap.set('n', '<leader>qx', ':qa!<CR>',{noremap = true, desc = "Quit nvim (no save)"})

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Goto declaration"})
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Goto definition"})
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { buffer = ev.buf, desc = "Info on keyword under cursor"})
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Goto implementation"})
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Goto type definition"})
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename buffer"})
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Actions"})
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { buffer = ev.buf, desc = "List references"})
    -- vim.keymap.set('n', '<leader>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})

-- git
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {desc = "Git preview hunk"})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {desc = "Git toggle blame"})
vim.keymap.set("n", "<leader>gs", ":Neogit<CR>", {desc = "Neogit status"})
