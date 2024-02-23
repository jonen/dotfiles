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
    require("which-key").register({
      ["<leader>b"] = {
        name = "+buffer",
        c = { ":BufferClose<CR>", "Close current buffer" },
        i = { "gg=G``", "Indent current buffer"}, -- indent and keep current cursor position
        o = { "<CMD>%bd|e#|bd#<CR>|'\"", "Close all other buffers" }, -- https://stackoverflow.com/a/60948057
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
        f = { "<CMD>Telescope find_files<CR>", "Find file" },
        g = { "<CMD>Telescope live_grep<CR>", "Grep files" },
        n = { "<CMD>enew<cr>", "New File" },
        r = { "<CMD>Telescope oldfiles<cr>", "Open recent file" },
        s = { ":w<CR>", "Save current file"}
      },
      ["<leader>g"] = {
        name = "+git",
        b = { ":Gitsigns toggle_current_line_blame<CR>", "Toggle git blame on line"},
        s = { ":Neogit<CR>", "Neogit status"},
      },
      ["<leader>n"] = {
        name = "+notifications",
        d = { function() require("notify").dismiss({silent=true,pending=true}) end, "Dismiss all notifications"},
        s = { "<CMD>Telescope notify<CR>", "Show all notifications"},
      },
      ["<leader>q"] = {
        name = "+quit",
        f = { ":qa!<CR>", "Quit (force, no save)"},
        q = {":qa<CR>", "Quit"},
        s = {":wqa<CR>", "Quit (and save all)"},
      },
      ["<leader>t"] = {
        name = "+tab",
        ["1"] = { "<CMD>BufferGoto 1<CR>", "Goto tab 1"},
        ["2"] = { "<CMD>BufferGoto 2<CR>", "Goto tab 2"},
        ["3"] = { "<CMD>BufferGoto 3<CR>", "Goto tab 3"},
        ["4"] = { "<CMD>BufferGoto 4<CR>", "Goto tab 4"},
        ["5"] = { "<CMD>BufferGoto 5<CR>", "Goto tab 5"},
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
