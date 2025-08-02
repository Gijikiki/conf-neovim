-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',

  -- Register the keymaps
  config = function()
    require("nvim-treesitter.configs").setup({
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>nn",
          node_incremental = "<leader>ni",
          scope_incremental = "<leader>ns",
          node_decremental = "<leader>nd",
        },
      },
    })
    require("which-key").add({
      { '<leader>n', group = 'Treesitter', mode = 'n' },
      { '<leader>nn', desc = 'I[n]it selection', mode = 'n' },
      { '<leader>ni', desc = 'Node [i]ncremental', mode = 'n' },
      { '<leader>ns', desc = 'Scope [i]ncremental', mode = 'n'  },
      { '<leader>nd', desc = 'Node [d]encremental', mode = 'n'  },
    })
  end,

  main = 'nvim-treesitter.configs', -- Sets main module to use for opts

  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },

  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
