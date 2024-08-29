vim.api.nvim_create_user_command('TT', function()
  vim.cmd 'botright split | resize 20% | term'
end, {})
