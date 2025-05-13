require("config.keymaps")
require("config.lazy")
require("mason").setup()
require("mason-lspconfig").setup()
require("lsp")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.shiftwidth = 4 -- Default indent size (change per filetype)
vim.opt.tabstop = 4 -- Number of spaces per tab
vim.opt.softtabstop = 4 -- Makes backspace treat spaces like tabs

vim.opt.number = true -- Always show absolute line numbers
vim.opt.relativenumber = true -- Enable relative numbers by default

-- Disable relative numbers in `NvimTree`
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "NvimTree_*",
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
	end,
})

-- Enable relative numbers everywhere else dynamically
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "NvimTree" then
			vim.opt.relativenumber = false
		end
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "NvimTree" then
			vim.opt.relativenumber = true
		end
	end,
})

-- Configure diagnostics
vim.diagnostic.config({
	virtual_text = false, -- no inline error text
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = false,
		header = "",
		prefix = "",
	},
})

-- Set up autocommand to show diagnostics on CursorHold
vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})
