vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.opt.mouse = ""
vim.g.mapleader = " "
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5
vim.opt.conceallevel = 1
vim.opt.background = "dark"

-- stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- replace doesn't copy to clipboard
vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set(
	"n",
	"<leader>tc",
	":setlocal <C-R>=&conceallevel ? 'conceallevel=0' : 'conceallevel=2'<CR><CR>",
	{ desc = "[T]oggle [C]onceallevel" }
)

-- set clipboard
vim.opt.clipboard = "unnamedplus"

-- markdown
vim.g.markdown_fenced_languages = {
	"html",
	"python",
	"lua",
	"vim",
	"typescript",
	"javascript",
	"sh",
	"bash",
	"cpp",
	"lisp",
	"lua",
	"make",
	"cmake",
	"rust",
}

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Enable blinking cursor in insert mode
vim.opt.guicursor =
	"n-v-c-sm:block,i-ci-ve:block-blinkwait300-blinkon200-blinkoff150,r-cr-o:hor20-blinkwait300-blinkon200-blinkoff150"
