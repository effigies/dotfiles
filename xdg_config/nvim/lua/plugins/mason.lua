-- Setup mason and mason-lspconfig
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "rust-analyzer",
        "python-lsp-server",
        "ruff",
        "deno",
        "bash-language-server",
        "lua-language-server",
      },
    })
  end,
}
