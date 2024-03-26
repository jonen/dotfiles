return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		ensure_installed = {
			"ruff",
			"ruff-lsp",
			"mypy",
			"isort",
			"black",
			"stylua",
			"pyright",
			"clangd",
			"lua_ls",
		},
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					plugins = {
						black = { enabled = true },
					},
				},
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.omnisharp.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff_lsp.setup({
				init_options = {
					settings = {
						args = {},
					},
				},
			})
		end,
	},
}
