-- [[ Treesitter Configuration ]]
-- See `:help nvim-treesitter`
--
-- Highlight, edit, and navigate code

local function merge_tables(t1, t2)
  for key, val in pairs(t2) do
    t1[key] = val
  end
  return t1
end

return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag'
  },
  build = ':TSUpdate',
  opts = {},
  config = vim.schedule(function()
    -- Set base languages
    local languages = { 'c', 'bash', 'lua', 'python', 'rust', 'java', 'vimdoc', 'vim' }

    -- Set webdev languages
    languages = merge_tables(languages, { 'css', 'html', 'javascript', 'json', 'tsx', 'typescript' })

    -- Set docker languages
    languages = merge_tables(languages, { 'dockerfile' })

    local opts = {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = languages,

      -- Autoinstall languages that are not installed
      auto_install = false,

      -- Synchronously install parsers (only for `ensure_installed`)
      sync_install = false,

      -- Auto tag completion for html
      autotag = { enable = true },

      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }

    require('nvim-treesitter.configs').setup(opts)
  end)
}
