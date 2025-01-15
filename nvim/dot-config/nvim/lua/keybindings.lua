-- remap window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- oil.nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Map Command+S to :wq
if vim.fn.has("mac") == 1 then
	vim.keymap.set("n", "<D-s>", ":w<CR>", { noremap = true, silent = true })
	vim.keymap.set("i", "<D-s>", "<C-O>:w<CR>", { noremap = true, silent = true })
end

if vim.fn.has("mac") == 1 then
	-- Map Command+C to copy (yank)
	vim.keymap.set("n", "<D-c>", '"+y', { noremap = true, silent = true })
	vim.keymap.set("v", "<D-c>", '"+y', { noremap = true, silent = true })
	vim.keymap.set("i", "<D-c>", '<Esc>"+yi', { noremap = true, silent = true })

	-- Map Command+X to cut
	vim.keymap.set("n", "<D-x>", '"+d', { noremap = true, silent = true })
	vim.keymap.set("v", "<D-x>", '"+d', { noremap = true, silent = true })
	vim.keymap.set("i", "<D-x>", '<Esc>"+di', { noremap = true, silent = true })

	-- Map Command+V to paste
	vim.keymap.set("n", "<D-v>", '"+p', { noremap = true, silent = true })
	vim.keymap.set("i", "<D-v>", '<Esc>"+pa', { noremap = true, silent = true })
	vim.keymap.set("v", "<D-v>", '"+p', { noremap = true, silent = true })
end
