return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
    },
    config = function ()
      local ngit = require("neogit")

      ngit.setup({
        kind = 'vsplit',
        signs = {
          -- { CLOSED, OPENED }
          hunk = { "", "" },
          item = { "󰍜", "󰮫" },
          section = { "󰍜", "󰮫" },
        },
      })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 300,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
      })
    end
  }
}
