return {
  'epwalsh/pomo.nvim',
  version = '*', -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { 'TimerStart', 'TimerRepeat', 'TimerSession' },
  dependencies = {
    'rcarriga/nvim-notify',
  },
  opts = {
    -- run session with :TimerSession [session]
    sessions = {
      pomodoro = {
        { name = 'Work', duration = '25m' },
        { name = 'Short Break', duration = '5m' },
        { name = 'Work', duration = '25m' },
        { name = 'Short Break', duration = '5m' },
        { name = 'Work', duration = '25m' },
        { name = 'Long Break', duration = '15m' },
      },
    },
  },
}
