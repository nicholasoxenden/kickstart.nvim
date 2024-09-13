return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          globalstatus = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '█', right = '█' },
        },
        sections = {
          lualine_b = {
            { 'branch', icon = '' },
            'diff',
            'diagnostics',
          },
          lualine_c = {
            { 'filename', path = 1 },
          },
          lualine_x = {
            {
              -- show recording in statusline
              require('noice').api.statusline.mode.get,
              cond = require('noice').api.statusline.mode.has,
              color = { fg = '#ff9e64' },
            },
            -- add pomo
            function()
              local ok, pomo = pcall(require, 'pomo')
              if not ok then
                return ''
              end

              local timer = pomo.get_first_to_finish()
              if timer == nil then
                return '󰄉  not set'
              end

              return '󰄉 ' .. tostring(timer)
            end,
            'encoding',
            'filetype',
          },
        },
      }
    end,
  },
}
