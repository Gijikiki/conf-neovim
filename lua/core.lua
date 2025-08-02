vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1 -- required for nvim-tree
vim.g.loaded_netrwPlugin = -1 -- required for nvim-tree

vim.g.mapleader = " " -- Set <space> as the leader key - must be set before plugins are loaded
vim.g.maplocalleader = " "

-- See `:help vim.opt`
vim.opt.breakindent = true 		-- Enable break indent to keep indent for wrapping
-- vim.opt.clipboard - see section below
vim.opt.colorcolumn = "121" 		-- Change the background color for col 121
vim.opt.cursorline = true 		-- Show what line your cursor is on
-- vim.opt.hlsearch - see section below
vim.opt.ignorecase = true		-- Case insensitive search
vim.opt.inccommand = "split"		-- Preview substitutions live
vim.opt.list = true			-- Show certain characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse = 'a'			-- Enable mouse mode
vim.opt.number = true
vim.opt.relativenumber = true		-- Relative line numbers
vim.opt.scrolloff = 999			-- Hack to center current line
vim.opt.showmode = false		-- Don't show the mode, since it is in the status line
vim.opt.signcolumn = 'yes'		-- Not boolean
vim.opt.smartcase = true		-- Override case insensitive search when capital letters or \C
vim.opt.smartindent = false		-- Use treesitter's indent instead
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 250		-- Displays which-key popup sooner
vim.opt.undofile = true			-- Save undo history
vim.opt.updatetime = 250		-- Decrease update time
vim.opt.virtualedit = "block"		-- Allow visual blocks to go past end of line


-- Custom search
vim.opt.hlsearch = true			-- Highlight on search but clear in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Clipboard Section
-- Set win32yank as clipboard if WSL
-- Requires win32yank in path: https://github.com/equalsraf/win32yank
local function is_wsl()
  local version = vim.fn.readfile("/proc/version")[1] or ""
  return version:match("Microsoft") or version:match("WSL")
end

if is_wsl() then
    vim.g.clipboard = {
      name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0
  }
end

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

