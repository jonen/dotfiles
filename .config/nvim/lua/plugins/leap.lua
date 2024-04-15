return {
	"ggandor/leap.nvim",
	config = function()
		require("leap").setup({
			-- Configuration here, or leave empty to use defaults
		})
		require("leap").create_default_mappings()
	end,
}
