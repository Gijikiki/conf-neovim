local function ihl_colorful()
  -- Colorful indent highlights
  require("ibl").setup({
    indent = {
      highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      },
    },
  })
end

local function ihl_normal()
  -- Normal indent highlights
  require("ibl").setup({
    indent = {},
    enabled = true
  })
end

local function ihl_off()
  -- Turn off indent highlights
  require("ibl").setup({ enabled = false })
end

local function set_hl_colors()
  -- Set indent colors for colorful indent indicators
  local hooks = require "ibl.hooks"
  -- create the highlight groups in the highlight setup hook, so they are reset
  -- every time the colorscheme changes
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  end)
end

-- Show indent
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    set_hl_colors()
    vim.keymap.set("n", "<leader>tih", ihl_colorful, {desc = "[T]urn [I]ndent [H]ighlight On"})
    vim.keymap.set("n", "<leader>tin", ihl_normal, {desc = "[T]urn [I]ndent [N]ormal on"})
    vim.keymap.set("n", "<leader>tio", ihl_off, {desc = "[T]urn [I]ndent [O]ff"})
  end,
  opts = {
    hooks = {
      highlight = {
        setup = {
          function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
          end,
        },
      },
    },
  },
}
