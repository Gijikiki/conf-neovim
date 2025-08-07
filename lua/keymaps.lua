-- NOTE: This won't work in all terminal emulators/tmux/etc.
-- You can just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- nvim tree functions
--
-- nvim tree toggle open
local function open_nvim_tree()
  require("nvim-tree.api").tree.toggle({
    find_file = true,
    focus = false,
  })
end

-- Function to toggle line numbers from relative to absolute
local function toggle_line_numbers()
  vim.o.relativenumber = not vim.o.relativenumber
end

local function toggle_scrolloff()
  if vim.opt.scrolloff:get() > 0 then
    vim.opt.scrolloff = 0
  else
    vim.opt.scrolloff = 999
  end
end

-- Function for ghost text toggling
local isLspDiagnosticsVisible = true
local function toggle_ghost_text()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible,
  })
end

-- Copilot function for keymaps
-- Disable plugin
-- local function copilot_buffer()
--   local input = vim.fn.input("Quick Chat: ")
--   if input ~= "" then
--     require("CopilotChat").ask(input, {
--       selection = require("CopilotChat.select").buffer
--       })
--   end
-- end

-- Note <leader>ca is used by code actions
-- Disable plugin
-- vim.keymap.set("n", "<leader>cb", copilot_buffer, {desc = "[B]uffer question"})
-- vim.keymap.set("n", "<leader>co", require("CopilotChat").open, {desc = "[O]pen" })
-- vim.keymap.set("n", "<leader>cr", require("CopilotChat").reset, {desc = "[R]eset" })
-- vim.keymap.set("n", "<leader>ct", require("CopilotChat").toggle, {desc = "[T]oggle" })
-- vim.keymap.set("n", "<leader>cx", require("CopilotChat").open, {desc = "[X] Close" })

-- Configure keymaps for telescope
vim.keymap.set("n", "<leader><leader>", require("telescope.builtin").buffers, {desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>f.", require("telescope.builtin").oldfiles, {desc = '[F]ind Recent Files ("." repeat)' })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, {desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, {desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>fn",
  function()
    require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
  end,
 {desc = "[F]ind [N]eovim files" }
 )
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, {desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>ft", require("telescope.builtin").builtin, {desc = "[F]ind Select [T]elescope" })
vim.keymap.set("n", "<leader>fv", require("telescope.builtin").git_files, {desc = "[F]ind in Git ([V]ersion control)" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, {desc = "'[F]ind current [W]ord" })

-- Keymaps for git signs
vim.keymap.set("n", "<leader>gb", require("gitsigns").blame_line, {desc = "[B]lame" })
vim.keymap.set("n", "<leader>gc", require("telescope.builtin").git_commits, {desc = "[C]heckout commit" })
vim.keymap.set("n", "<leader>gd", "<cmd>Getsigns diffthis HEAD", {desc = "[D]iff" })
vim.keymap.set("n", "<leader>ghv", require("gitsigns").preview_hunk, {desc = "Pre[v]iew hunk" })
vim.keymap.set("n", "<leader>gn", require("gitsigns").next_hunk, {desc = "[N]ext hunk" })
vim.keymap.set("n", "<leader>go", require("telescope.builtin").git_status, {desc = "[O]pen changed file" })
vim.keymap.set("n", "<leader>gp", require("gitsigns").prev_hunk, {desc = "[P]rev hunk" })
vim.keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk, {desc = "[R]eset hunk" })
vim.keymap.set("n", "<leader>gs", require("gitsigns").stage_hunk, {desc = "[S]tage hunk" })
vim.keymap.set("n", "<leader>gt", require("gitsigns").reset_buffer, {desc = "Rese[t] buffer" })
vim.keymap.set("n", "<leader>gu", require("gitsigns").undo_stage_hunk, {desc = "[U]ndo stage hunk" })
vim.keymap.set("n", "<leader>gw", require("telescope.builtin").git_branches, {desc = "S[w]itch branch" })

-- Keymaps to toggle features
-- Indent management functions have been moved to `indent-blankline.lua`
--  Uses
--    - <leader>tio
--    - <leader>tin
--    - <leader>tih
vim.keymap.set("n", "<leader>tg", toggle_ghost_text, {desc = "[T]oggle [G]host Text" })
vim.keymap.set("n", "<leader>tr", toggle_line_numbers, {desc = "[T]oggle [R]elative Line Numbers" })
vim.keymap.set("n", "<leader>ts", toggle_scrolloff, {desc = "[T]oggle [S]crolloff" })
vim.keymap.set("n", "<leader>tt", open_nvim_tree, {desc = "[T]oggle nvim-[T]ree" })

-- Keymap for abbreviations
vim.cmd('abbreviate zzab ansible.builtin.')

-- Function & keymap for showing ghost text errors
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "[E]rror as float" })

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
