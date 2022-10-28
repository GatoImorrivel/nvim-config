local map = vim.api.nvim_set_keymap
local options = { noremap = true }
local optionSilent = { noremap = true, silent = true }
local optionExpr = { noremap = true, expr = true }
local optionSilentExpr = { noremap = true, silent = true, expr = true }

map('n', '<Space>', '', {})
map('i', 'jk', '<ESC>', options)
map('n', '<leader>e', ':NvimTreeToggle<cr>', optionSilent)
map('n', ';', ':', options)
map('n', '<C-S>', ':update<CR>', optionSilent)
map('n', '<leader>t', ':FloatermToggle<CR>', optionSilent)
map('n', '<leader>f', ':call CocAction(\'format\')<CR>', optionSilent)
map('v', '<C-S>', '<C-C>:update<CR>', optionSilent)
map('i', '<C-S>', '<C-O>:update<CR>', optionSilent)

vim.cmd([[
  inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
  inoremap <silent><expr> <c-space> coc#refresh()
  nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
]])
