-- Set lualine as the statusline
return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "onedark",
      component_separators = "|",
      section_separators = "",
      path = 2,                     -- 0 = just filename, 1 = relative path, 2 = absolute path
    },
  },
}

