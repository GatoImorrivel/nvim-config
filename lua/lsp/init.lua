local lspconfig = require("lspconfig")
local path = "lsp.servers"  -- Base path for requiring modules

local function load_servers()
  local scan = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/lsp/servers", "*.lua", false, true)

  for _, file in ipairs(scan) do
    local server = file:match("([^/]+)%.lua$")  -- Extract filename without .lua
    if server then
      local ok, setup = pcall(require, path .. "." .. server)
      if ok then
        setup(lspconfig)
      else
        vim.notify("Failed to load LSP: " .. server, vim.log.levels.WARN)
      end
    end
  end
end

load_servers()
