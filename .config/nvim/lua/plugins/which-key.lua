return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		require("which-key").register({
			["<leader>b"] = {
				name = "+buffer",
				b = { "<CMD>Telescope buffers<CR>", "Show buffer list" },
				c = { ":bd<CR>", "Close current buffer" },
				d = { ":bd<CR>", "Close current buffer" },
				i = { "gg=G``", "Indent current buffer" }, -- indent and keep current cursor position
				l = { "<CMD>Telescope buffers<CR>", "Show buffer list" },
				o = { "<CMD>BufferCloseAllButCurrent<CR>|'\"", "Close all other buffers" },
				n = { "<CMD>bn<CR>", "Next buffer" },
				p = { "<CMD>bp<CR>", "Previous buffer" },
				["1"] = { "<CMD>BufferGoto 1<CR>", "Goto buffer 1" },
				["2"] = { "<CMD>BufferGoto 2<CR>", "Goto buffer 2" },
				["3"] = { "<CMD>BufferGoto 3<CR>", "Goto buffer 3" },
				["4"] = { "<CMD>BufferGoto 4<CR>", "Goto buffer 4" },
				["5"] = { "<CMD>BufferGoto 5<CR>", "Goto buffer 5" },
				["6"] = { "<CMD>BufferGoto 5<CR>", "Goto buffer 6" },
				["7"] = { "<CMD>BufferGoto 5<CR>", "Goto buffer 7" },
				["8"] = { "<CMD>BufferGoto 5<CR>", "Goto buffer 8" },
				["9"] = { "<CMD>BufferGoto 5<CR>", "Goto buffer 9" },
				["0"] = { "<CMD>BufferLast<CR>", "Goto last buffer" },
			},
			["<leader>c"] = {
				name = "+code",
				a = { vim.lsp.buf.code_action, "Code actions" },
				g = {
					name = "+goto",
					d = { vim.lsp.buf.definition, "Goto definition" },
					D = { vim.lsp.buf.declaration, "Goto declaration" },
					i = { vim.lsp.buf.implementation, "Goto implementation" },
					n = { vim.diagnostic.goto_next, "Goto next diagnostic" },
					p = { vim.diagnostic.goto_prev, "Goto previous diagnostic" },
					r = { vim.lsp.buf.references, "List references" },
				},
				i = { vim.lsp.buf.hover, "Show information" },
				r = { vim.lsp.buf.rename, "Rename symbol" },
			},
			["<leader>e"] = {
				name = "+edit",
				c = {
					function()
						require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
					end,
					"Edit neovim config",
				},
			},
			["<leader>f"] = {
				name = "+file",
				["/"] = { "<CMD>Telescope current_buffer_fuzzy_find<CR>", "Find in file" },
				f = { "<CMD>Telescope find_files<CR>", "Find file" },
				g = { "<CMD>Telescope live_grep<CR>", "Grep files" },
				n = { "<CMD>enew<cr>", "New File" },
				o = { "<CMD>Oil<CR>", "Open Oil" },
				r = { "<CMD>Telescope oldfiles<cr>", "Open recent file" },
				s = { ":w<CR>", "Save current file" },
			},
			["<leader>g"] = {
				name = "+git",
				b = { ":Gitsigns toggle_current_line_blame<CR>", "Toggle git blame on line" },
				s = { ":Neogit<CR>", "Neogit status" },
			},
			["<leader>n"] = {
				name = "+notifications",
				d = {
					function()
						require("notify").dismiss({ silent = true, pending = true })
					end,
					"Dismiss all notifications",
				},
				s = { "<CMD>Telescope notify<CR>", "Show all notifications" },
			},
			["<leader>o"] = {
				name = "Obsidian",
				b = { "<CMD>ObsidianBacklinks<CR>", "Backlinks" },
				c = { "<CMD>ObsidianToggleCheckbox<CR>", "Toggle Checkbox" },
				d = { "<CMD>ObsidianDailies<CR>", "Daily notes" },
				f = { "<CMD>ObsidianSearch<CR>", "Find notes" },
				l = { "<CMD>ObsidianLinks<CR>", "Links" },
				n = { "<CMD>ObsidianNew<CR>", "New note" },
				o = { "<CMD>ObsidianOpen<CR>", "Open Obsidian.app" },
				t = { "<CMD>ObsidianToday<CR>", "Today" },
				w = { "<CMD>ObsidianWorkspace<CR>", "Change workspace" },
				y = { "<CMD>ObsidianYesterday<CR>", "Yesterday" },
			},
			["<leader>q"] = {
				name = "+quit",
				f = { ":qa!<CR>", "Quit (force, no save)" },
				q = { ":qa<CR>", "Quit" },
				s = { ":wqa<CR>", "Quit (and save all)" },
			},
			["<leader>s"] = {
				name = "+search",
				d = { "<CMD>set hlsearch!<CR>", "Toggle search highlight" },
			},
			["<leader>u"] = {
				name = "+undo",
				t = { "<cmd>lua require('undotree').toggle()<cr>", "Toggle undotree" },
			},
			["<leader>v"] = {
				name = "+venv",
				c = { "<cmd>VenvSelectCached<CR>", "Select cached venv" },
				s = { "<cmd>VenvSelect<CR>", "Select venv" },
			},
			["<leader>w"] = {
				name = "+window",
				c = { "<C-w>q", "Close current window" },
				o = { "<C-w>o", "Close all other windows" },
				s = {
					name = "+split",
					v = { ":vsplit<CR>", "Split window vertically" },
					h = { ":split<CR>", "Split window horizontally" },
				},
			},
		})
	end,
}
