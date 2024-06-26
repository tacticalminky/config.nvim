-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`
--
-- Remap keys for a better experience

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Toggles ]]
vim.keymap.set('n', '<leader>t', function() end, { desc = '+[T]oggle' })

-- Relative Line Numbers
vim.keymap.set('n', '<leader>tn', function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = '[T]oggle Relative Numbering' })

-- Autoformating
vim.keymap.set('n', '<leader>ta', function()
  vim.fn.execute('AutoFormatToggle', '')
end, { desc = '[T]oggle Autoformating' })

-- Focus Auto-resizing
vim.keymap.set('n', '<leader>tf', function()
  vim.fn.execute('FocusToggle', '')
end, { desc = '[T]oggle Focus Auto-resizing' })
