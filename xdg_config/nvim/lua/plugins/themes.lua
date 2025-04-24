return {
  {
    "vague2k/huez.nvim",
    branch = "stable",
    event = "UIEnter",
    priority = 1000,
    import = "huez-manager.import",
    config = function()
      require("huez").setup({
        fallback = "catppuccin",
      })
    end,
  },
  -- Sync terminal background, if supported
  { "typicode/bg.nvim", lazy = false },
}
