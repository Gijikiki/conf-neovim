-- nvim-tree
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      update_focused_file = { enable = true },
      git = { enable = true },
      view = { adaptive_size = true },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            file = vim.g.have_nerd_font,
            folder = vim.g.have_nerd_font,
            folder_arrow = vim.g.have_nerd_font,
            git = vim.g.have_nerd_font,
          },
        },
        symlink_destination = false,
      },
    })
  end,
}
