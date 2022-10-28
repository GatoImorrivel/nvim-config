local filename = require('statusbar._filename')
local lineinfo = require('statusbar._lineinfo')
local mode = require('statusbar._mode')
local fileicon = require('statusbar._fileicon')
local bar = require('statusbar._barline')
local git = require('statusbar._git')

-- Main status line
Statusline = {}

Statusline.active = function()
  return table.concat {
    "%#StatusLine#",
    mode.update_mode_colors(),
    mode.mode(),
    "%#StatuslineText# ",
    fileicon.get_file_icon(),
    filename.filename(),
    "%#StatusLine#",
    "%=%#StatusLine#",
    "%#StatuslineText#",
    git.branch(),
    lineinfo.lineinfo(),
  }
end

function Statusline.inactive()
  return " %F"
end

function Statusline.short()
  return "%#StatuslineTextine#   NvimTree"
end

function Statusline.override_colors()
  vim.api.nvim_exec([[
    augroup StatusLineColors
    au WinEnter,BufEnter * hi StatusLine guibg=#1b1c1e guifg=#1b1c1e
    au WinEnter,BufEnter * hi StatuslineText guibg=#1b1c1e guifg=#dadada
    au WinEnter,BufEnter * hi StatuslineIcons guibg=#1b1c1e guifg=#232326
    au WinEnter,BufEnter * hi StatuslineAccent guibg=#232326 guifg=#6cbfbf
    au WinEnter,BufEnter * hi StatuslineInsertAccent guibg=#232326 guifg=#ef7d7d
    au WinEnter,BufEnter * hi StatuslineVisualAccent guibg=#232326 guifg=#e5c76b
    au WinEnter,BufEnter * hi StatuslineReplaceAccent guibg=#232326 guifg=#8ccf7e
    au WinEnter,BufEnter * hi StatuslineCmdLineAccent guibg=#232326 guifg=#c47fd5
    au WinEnter,BufEnter * hi StatuslineTerminalAccent guibg=#232326 guifg=#c47fd5
    augroup END
  ]], false)
end

Statusline.tabline_init = function()
  vim.o.tabline = bar.init()
end

-- Apply status line
vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)

return Statusline
