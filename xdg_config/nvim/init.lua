-- Configuration is based on lazy.nvim
-- See lua/config/settings.lua for basic settings
require("config.settings")
-- lazy loads lua/plugins/*.lua
require("config.lazy")

require("lspconfig").ruff.setup({
  init_options = {
    settings = {
      configurationPreference = "filesystemFirst",
    },
  },
})
