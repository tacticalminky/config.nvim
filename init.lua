-- [[ Neovim Intitialization File ]]
--
-- Set remaps and base keysbinds
-- Install the package manager
-- And install packages/load configurations

require('remaps')
require('sets')

-- Install package manager
--  https://github.com/folke/lazy.nvim
--  `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  require('plugins.theme'),
  require('plugins.git'),
  require('plugins.lsp'),
  require('plugins.auto-cmp'),
  require('plugins.telescope'),
  require('plugins.treesitter'),
  require('plugins.harpoon'),

  -- Preconfigured plugins from kickstart
  -- require('plugins.debug'),
  require('plugins.autoformat')
}, {})
