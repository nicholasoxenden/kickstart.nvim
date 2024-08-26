vim.api.nvim_create_user_command('TT', function()
  vim.cmd 'botright split | resize 25% | term'
end, {})
