return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
    },
    -- config = true
    config = function ()
      local ngit = require("neogit")

      ngit.setup({
        kind = 'vsplit',
        signs = {
          -- { CLOSED, OPENED }
--          hunk = { "", "" },
          hunk = { "", "" },
--          item = { "", "" },
--          section = { "", "" },
          item = { "󰍜", "󰮫" },
          section = { "󰍜", "󰮫" },
        },
      })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }
}
