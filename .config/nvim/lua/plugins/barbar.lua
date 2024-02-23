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
    modified = {button = '●'},
    no_name_title = 'Untitled',
    sidebar_filetypes = {
      ['neo-tree'] = {event = 'BufWipeout'},
    },
    icons = {
      buffer_index = true,
      gitsigns = {
        added = {enabled = true, icon = '+'},
        changed = {enabled = true, icon = '~'},
        deleted = {enabled = true, icon = '-'},
      },
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
        [vim.diagnostic.severity.WARN] = {enabled = false},
        [vim.diagnostic.severity.INFO] = {enabled = false},
        [vim.diagnostic.severity.HINT] = {enabled = true},
      },
    }
  },
  version = '^1.0.0',
}
