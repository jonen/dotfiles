return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    ensure_installed = {
      "ruff",
      "ruff-lsp",
      "stylua",
      "pyright",
      "clangd",
      "lua_ls",
      "rust_analyzer",
    },
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        filetypes = { "python" },
        settings = {
          plugins = {
            ruff = { enabled = true },
          },
        },
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        filetypes = { "rust" },
        root_dir = lspconfig.util.root_pattern("Cargo.toml"),
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      })
      lspconfig.ruff_lsp.setup({
        init_options = {
          settings = {
            args = {},
          },
        },
      })
    end,
  },
}
