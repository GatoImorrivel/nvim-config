local lspconfig = require("lspconfig")
local path = "lsp.servers" -- Base path for requiring modules

local function setup_lsp_diags()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		signs = true,
		update_in_insert = false,
		underline = true,
	})
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		max_width = 80,
		anchor = "SW", -- Anchor top-left of window to bottom-right of cursor
		relative = "cursor",
		offset_y = -1, -- Puts it above the cursor
	})
end

local function load_servers()
	local scan = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/lsp/servers", "*.lua", false, true)

	for _, file in ipairs(scan) do
		local server = file:match("([^/]+)%.lua$") -- Extract filename without .lua
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
setup_lsp_diags()
