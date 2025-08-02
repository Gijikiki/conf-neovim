-- lua/plugins/autocmds/init.lua
local autocmd_dir = vim.fn.stdpath("config") .. "/lua/autocmds"

for _, file in ipairs(vim.fn.readdir(autocmd_dir)) do
  if file:sub(-4) == ".lua" and file ~= "init.lua" then
    local ok, err = pcall(require, "autocmds." .. file:sub(1, -5))
    if not ok then
      vim.notify("Error loading autocmd: " .. file .. "\n\n" .. err, vim.log.levels.ERROR)
    end
  end
end
