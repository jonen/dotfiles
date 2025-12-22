return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				lazy = true,
				ensure_installed = {
					"prettier",
					"prettierd",
					"stylua",
					"isort",
					"black",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ruff",
					"pyright",
					"lua_ls",
					"rust_analyzer",
				},
				opts = {
					auto_install = true,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local util = require("lspconfig.util")

			local server_configs = {
				lua_ls = {},
				pyright = {
					filetypes = { "python" },
					settings = {
						plugins = {
							ruff = { enabled = true },
						},
					},
				},
				clangd = {},
				rust_analyzer = {
					filetypes = { "rust" },
					root_dir = util.root_pattern("Cargo.toml"),
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				},
			}

			for server, config in pairs(server_configs) do
				config.capabilities = capabilities
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
