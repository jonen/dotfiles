return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    auto_hide = 1,
    clickable = true,
    focus_on_close = 'left',
    modified = { button = '●' },
    no_name_title = 'Untitled',
    preset = 'powerline',
    sidebar_filetypes = {
      ['neo-tree'] = { event = 'BufWipeout' },
    },
    icons = {
      buffer_index = true,
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = ' ' },
        [vim.diagnostic.severity.WARN] = { enabled = false },
        [vim.diagnostic.severity.INFO] = { enabled = false },
        [vim.diagnostic.severity.HINT] = { enabled = true },
      },
    }
  },
  version = '^1.0.0',
}
