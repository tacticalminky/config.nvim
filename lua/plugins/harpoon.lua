-- harpoon.lua

return {
  'ThePrimeagen/harpoon',
  config = function ()
    vim.keymap.set('n', '<leader>a', require('harpoon.mark').add_file, { desc = '[A]dd file' })
    vim.keymap.set('n', '<C-e>', require('harpoon.ui').toggle_quick_menu, { desc = 'Toggle Quick Menu' })

    for i = 1, 4
    do
      vim.keymap.set('n', '<leader>n' .. i, function () require('harpoon.ui').nav_file(i) end, { desc = '[N]avigate to file ' .. i })
    end
  end
}

