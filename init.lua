-- Originally from kickstart.nvim
--  Took that as an example when I first started switched from vim to neovim, but this has been heavily modified
require("core")

require("lazy_bootstrap")
local lazy_ui = require("lazy_config.ui")
require("lazy").setup(
  {
    { import = "themes" },
    { import = "plugins" },
  },
  { ui = lazy_ui }
)
require("keymaps")
require("filetypes")
require("autocmds")
