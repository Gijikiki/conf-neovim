-- Avante plugin configuration for Neovim
-- Integrates with GitHub Copilot (copilot.lua)

return {
  "yetone/avante.nvim",
  opts = {
    windows = {
      ask = {
        floating = false,
        start_insert = true,
        border = "rounded",
      },
      input = {
        height = 10,
      },
    },
    provider = "copilot",
    on_open = function()
      vim.api.nvim_buf_set_keymap(
        -- 0 is current buffer
        0, "n", "<CR>", ":lua require('avante').submit()<CR>", { noremap = true, silent = true }
      )
    end,
    selector = {
      exclude_auto_select = { "NvimTree" },
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
    {
      "folke/which-key.nvim", -- Add which-key as a dependency
      config = function()
        require("which-key").add({
          { '<leader>a', group = 'Avante', mode = 'n' },
        })
      end,
    },
  },
  build = "make",
  -- keys = {
  --   {
  --     "<leader>a+",
  --     function()
  --       local tree_ext = require("avante.extensions.nvim_tree")
  --       tree_ext.add_file()
  --     end,
  --     desc = "Select file in NvimTree",
  --     ft = "NvimTree",
  --   },
  --   {
  --       "<leader>a-",
  --       function()
  --     local tree_ext = require("avante.extensions.nvim_tree")
  --     tree_ext.remove_file()
  --       end,
  --       desc = "Deselect file in NvimTree",
  --       ft = "NvimTree",
  --   },
  -- },
}
