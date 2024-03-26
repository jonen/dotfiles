return { -- Autoformat
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 1000,
			async = false,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff", "isort", "black" },
			javascript = { { "prettierd", "prettier" } },
		},
	},
}
