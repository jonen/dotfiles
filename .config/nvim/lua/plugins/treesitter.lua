return  {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"c", "lua", "query", "vim", "vimdoc", "python"},
      indent = { enable = true },
      highlight = { enable = true },
      autotag = { enable = true },
    })
  end
}
