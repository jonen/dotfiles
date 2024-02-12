require'nvim-treesitter.configs'.setup {
  -- A list of parser name, or "all"
  ensure_installed = { "c", "lua", "vim", "python" },

  -- Install parsers in above list
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
