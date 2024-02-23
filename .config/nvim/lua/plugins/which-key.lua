return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
  },
  config = function ()
    local wk = require("which-key")
    wk.register({
      ["<leader>b"] = {
        name = "+buffer",
        c = { ":BufferClose<CR>", "Close current buffer" },
        i = { "migg=`i", "Indent current buffer"},
      },
      ["<leader>c"] = {
        name = "+code",
        a = { vim.lsp.buf.code_action, "Code actions"},
        g = {
          name = "+goto",
          d = { vim.lsp.buf.definition, "Goto definition"},
          D = { vim.lsp.buf.declaration, "Goto declaration"},
          i = { vim.lsp.buf.implementation, "Goto implementation"},
        },
        i = { vim.lsp.buf.hover, "Show information"},
        r = { vim.lsp.buf.references, "List references"},
      },
      ["<leader>f"] = {
        name = "+file",
        f = { "<cmd>Telescope find_files<cr>", "Find file" },
        n = { "<cmd>enew<cr>", "New File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
        s = { ":w<CR>", "Save current file"}
      },
      ["<leader>g"] = {
        name = "+git",
        b = { ":Gitsigns toggle_current_line_blame<CR>", "Toggle git blame on line"},
        s = { ":Neogit<CR>", "Neogit status"},
      },
      ["<leader>q"] = {
        name = "+quit",
        f = { ":qa!<CR>", "Quit (force, no save)"},
        q = {":qa<CR>", "Quit"},
        s = {":wqa<CR>", "Quit (and save all)"},
      },
      ["<leader>v"] = {
        name = '+venv',
        c = { "<cmd>VenvSelectCached<CR>", "Select cached venv"},
        s = { "<cmd>VenvSelect<CR>", "Select venv"},
      },
      ["<leader>w"] = {
        name = "+window",
        c = { "<C-w>q", "Close current window" },
        o = { "<C-w>o", "Close all other windows"},
        s = {
          name = "+split",
          v = {":vsplit<CR>", "Split window vertically"},
          h = {":split<CR>", "Split window horizontally"},
        }
      }
    })
  end
}
