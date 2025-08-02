-- Copilot chat
return  {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
  },
  config = function()
    require("CopilotChat").setup()
  end,
}
