local modes = {
  ["n"] = "",
  ["no"] = "",
  ["v"] = "",
  ["V"] = "",
  [""] = "",
  ["s"] = "濾",
  ["S"] = "驪",
  [""] = "里",
  ["i"] = "",
  ["ic"] = "",
  ["R"] = "易",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "",
}

local cmd = vim.api.nvim_command

local M = {}

-- Mode module
function M.mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local icon_color = "%#StatuslineIcons#"
  return string.format("%s %s", modes[current_mode], icon_color)
end

function M.update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatusLineAccent#"
  if current_mode == "n" then
      mode_color = "%#StatuslineAccent#"
  elseif current_mode == "i" or current_mode == "ic" then
      mode_color = "%#StatuslineInsertAccent#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
      mode_color = "%#StatuslineVisualAccent#"
  elseif current_mode == "R" then
      mode_color = "%#StatuslineReplaceAccent#"
  elseif current_mode == "c" then
      mode_color = "%#StatuslineCmdLineAccent#"
  elseif current_mode == "t" then
      mode_color = "%#StatuslineTerminalAccent#"
  end
  return mode_color
end

return M
