return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'jonarrien/telescope-cmdline.nvim',
    },
    keys = {
      { ':', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
      { '<leader><leader>', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' }
    },
    opts = {
      extensions = {
        cmdline = {
          picker = {
            layout_config = {
              width  = 60,
              height = 15,
            }
          },
          mappings    = {
            complete      = '<Tab>',
            run_selection = '<C-CR>',
            run_input     = '<CR>',
          },
        }
      }
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("cmdline")
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find files"})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live grep files"})
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
}
