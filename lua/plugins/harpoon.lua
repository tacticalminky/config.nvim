-- [[ Harpoon Configuration ]]
--
-- Bookmark and quickly change to files

return {
  'ThePrimeagen/harpoon',
  config = function ()
    require('which-key').register({ ['<leader>h'] = '+[H]arpoon'})

    vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon [A]dd file' })
    vim.keymap.set('n', '<C-h>', require('harpoon.ui').toggle_quick_menu, { desc = 'Toggle Harpoon Quick Menu' })

    for i = 1, 9
    do
      vim.keymap.set('n', '<leader>h' .. i, function () require('harpoon.ui').nav_file(i) end, { desc = '[H]arpoon goto file ' .. i })
    end
  end
}
