return {
	"ggandor/leap.nvim",
	config = function()
		require("leap").setup({
			-- Configuration here, or leave empty to use defaults
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)"),
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)"),
			vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)"),
		})
		require("leap").create_default_mappings()
	end,
}
