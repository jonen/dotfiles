return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    auto_hide = false,
    clickable = true,
    focus_on_close = 'left',
    sidebar_filetypes = {
      ['neo-tree'] = {event = 'BufWipeout'},
    }
  },
  version = '^1.0.0',
}
