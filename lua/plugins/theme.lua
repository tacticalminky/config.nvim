-- [[ Theme Configuration ]]
--
-- Configures the color scheme, statusline, and other visual sugar

return {
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    opts = {
      style = 'darker',
      transparent = true,
      colors = {
        my_grey = '#919191'
      },
      highlights = {
        LineNr = { fg = '$my_grey' },
        ['@comment'] = { fg = '$my_grey' }
      }
    },
    config = function(_, opts)
      require('onedark').setup(opts)

      vim.cmd.colorscheme('onedark')
    end
  },
  {
    -- Set lualine as statusline
    -- See `:help lualine.txt`
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    }
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = "ibl",
    opts = {}
  }
}
