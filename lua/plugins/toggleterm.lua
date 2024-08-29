return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  config = function()
    local toggleterm = require 'toggleterm'
    local Terminal = require('toggleterm.terminal').Terminal

    local lazygit = Terminal:new { cmd = 'lazygit', direction = 'float' }

    vim.keymap.set('n', '<leader>tt', function()
      toggleterm.toggle_command(nil, nil)
    end, { desc = '[t]oggle [t]erminal' })

    vim.keymap.set('n', '<leader>g', function()
      lazygit:toggle()
    end, { noremap = true, silent = true })
  end,
}
