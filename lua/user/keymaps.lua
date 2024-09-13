local nnoremap = require('user.keymap_utils').nnoremap
local vnoremap = require('user.keymap_utils').vnoremap
local inoremap = require('user.keymap_utils').inoremap
local tnoremap = require('user.keymap_utils').tnoremap
local xnoremap = require('user.keymap_utils').xnoremap

-- Disable Space bar since it'll be used as the leader key
nnoremap('<space>', '<nop>')

-- Execute current file (good for lua)
nnoremap('<leader>X', function()
  vim.cmd 'w'
  vim.cmd 'source %'
end, { desc = 'Execute current file' })

-- Create new tab
nnoremap('<leader>T', '<cmd>tabnew<cr>', { desc = 'Create new tab' })

-- Window navigation
nnoremap('<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
nnoremap('<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
nnoremap('<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
nnoremap('<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Swap between last two buffers
nnoremap("<leader>'", '<C-^>', { desc = 'Switch to last buffer' })

-- Save with leader key
nnoremap('<leader>w', '<cmd>w<cr>', { silent = false })

-- Quit with leader key
nnoremap('<leader>q', '<cmd>q<cr>', { silent = false })

-- Save and Quit with leader key
nnoremap('<leader>z', '<cmd>wq<cr>', { silent = false })

-- Map Oil to <leader>e
nnoremap('<leader>e', function()
  require('oil').toggle_float()
end, { desc = 'Toggle oil' })

-- Center buffer while navigating
nnoremap('<C-u>', '<C-u>zz')
nnoremap('<C-d>', '<C-d>zz')
nnoremap('{', '{zz')
nnoremap('}', '}zz')
nnoremap('N', 'Nzz')
nnoremap('n', 'nzz')
nnoremap('G', 'Gzz')
nnoremap('gg', 'ggzz')
nnoremap('gd', 'gdzz')
nnoremap('<C-i>', '<C-i>zz')
nnoremap('<C-o>', '<C-o>zz')
nnoremap('%', '%zz')
nnoremap('*', '*zz')
nnoremap('#', '#zz')

-- Press 'S' for quick find/replace for the word under the cursor
nnoremap('S', function()
  local cmd = ':%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>'
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, 'n', false)
end)

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap('L', '$')
nnoremap('H', '^')

-- Press 'U' for redo
nnoremap('U', '<C-r>')

-- Turn off highlighted results
nnoremap('<leader>no', '<cmd>noh<cr>')

-- Diagnostics --
-- Goto next diagnostic of any severity
nnoremap(']d', function()
  vim.diagnostic.goto_next {}
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Goto previous diagnostic of any severity
nnoremap('[d', function()
  vim.diagnostic.goto_prev {}
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Goto next error diagnostic
nnoremap(']e', function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Goto previous error diagnostic
nnoremap('[e', function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Goto next warning diagnostic
nnoremap(']w', function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.WARN }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Goto previous warning diagnostic
nnoremap('[w', function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.WARN }
  vim.api.nvim_feedkeys('zz', 'n', false)
end)

-- Moonlander diagnostic movements --

-- Open the diagnostic under the cursor in a float window
nnoremap('<leader>d', function()
  vim.diagnostic.open_float {
    border = 'rounded',
  }
end)

-- Place all dignostics into a qflist
nnoremap('<leader>ld', vim.diagnostic.setqflist, { desc = 'Quickfix [L]ist [D]iagnostics' })

-- Navigate to next qflist item
nnoremap('<leader>cn', ':cnext<cr>zz')

-- Navigate to previos qflist item
nnoremap('<leader>cp', ':cprevious<cr>zz')

-- Open the qflist
nnoremap('<leader>co', ':copen<cr>zz')

-- Close the qflist
nnoremap('<leader>cc', ':cclose<cr>zz')

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap('<leader>m', ':MaximizerToggle<cr>')

-- Resize split windows to be equal size
nnoremap('<leader>=', '<C-w>=')

-- Press leader rw to rotate open windows
nnoremap('<leader>rw', ':RotateWindows<cr>', { desc = '[R]otate [W]indows' })

-- Press gx to open the link under the cursor
nnoremap('gx', ':sil !open <cWORD><cr>', { silent = true })

-- Symbol Outline keybind
nnoremap('<leader>so', ':SymbolsOutline<cr>')

-- nvim-ufo keybinds
nnoremap('zR', require('ufo').openAllFolds)
nnoremap('zM', require('ufo').closeAllFolds)

-- Map jj to <esc>
inoremap('jj', '<esc>')

-- Disable Space bar since it'll be used as the leader key
vnoremap('<space>', '<nop>')

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vnoremap('L', '$<left>')
vnoremap('H', '^')

-- Paste without losing the contents of the register
vnoremap('<A-j>', ":m '>+1<CR>gv=gv")
vnoremap('<A-k>', ":m '<-2<CR>gv=gv")

xnoremap('<leader>p', '"_dP')

-- Reselect the last visual selection
xnoremap('<<', function()
  -- Move selected text up/down in visual mode
  vim.cmd 'normal! <<'
  vim.cmd 'normal! gv'
end)

xnoremap('>>', function()
  vim.cmd 'normal! >>'
  vim.cmd 'normal! gv'
end)

-- Terminal --
-- Enter normal mode while in a terminal
tnoremap('<esc>', [[<C-\><C-n>]])
tnoremap('jj', [[<C-\><C-n>]])

-- Window navigation from terminal
tnoremap('<C-h>', [[<Cmd>wincmd h<CR>]])
tnoremap('<C-j>', [[<Cmd>wincmd j<CR>]])
tnoremap('<C-k>', [[<Cmd>wincmd k<CR>]])
tnoremap('<C-l>', [[<Cmd>wincmd l<CR>]])

-- Reenable default <space> functionality to prevent input delay
tnoremap('<space>', '<space>')

-- Clear highlights on search when pressing <Esc> in normal mode
nnoremap('<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
nnoremap('<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

nnoremap('<leader>go', '<cmd>DiffviewOpen<cr>', { desc = '[D]iffview [O]pen' })
nnoremap('<leader>gc', '<cmd>DiffviewClose<cr>', { desc = '[D]iffview [C]lose' })
