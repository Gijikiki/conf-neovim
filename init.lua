-- Originally from kickstart.nvim
--  Took that as an example when I first started switched from vim to neovim,
--    but this has been heavily modified

-- Load core settings and configurations
require("core")

-- Bootstrap the lazy plugin manager, must come before lazy
require("lazy_bootstrap")

-- Load and configure lazy UI for plugin setup
local lazy_ui = require("lazy_config.ui")
require("lazy").setup(
  {
    { import = "themes" }, -- Import theme-related plugins
    { import = "plugins" }, -- Import general plugins
  },
  { ui = lazy_ui } -- Pass lazy UI settings
)

-- Define custom key mappings
require("keymaps")

-- Configure custom filetypes
require("filetypes")

-- Set up autocommands
require("autocmds")
