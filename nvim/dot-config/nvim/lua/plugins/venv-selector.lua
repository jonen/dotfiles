return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python",
	},
	-- branch = "regexp",
	opts = {
		-- Your options go here
		name = { ".venv" },
		auto_refresh = true,
		stay_on_this_version = true,
		vim.api.nvim_create_autocmd("VimEnter", {
			desc = "Auto select virtualenv Nvim open",
			pattern = "*",
			callback = function()
				local venv = vim.fn.finddir(".venv", vim.fn.getcwd() .. ";")
				if venv ~= "" then
					require("venv-selector").retrieve_from_cache()
				end
			end,
			once = true,
		}),
	},
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
}
