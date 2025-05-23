vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })

-- Telescope
vim.keymap.set("n", "<Leader>f", function()
	require("telescope.builtin").find_files()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>s", function()
	require("telescope.builtin").live_grep()
end, { noremap = true, silent = true })

-- Nvim-Tree
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Conform
vim.keymap.set("n", "<Leader>c", function()
	require("conform").format({ lsp_fallback = true })
end, { noremap = true, silent = true, desc = "Format Document" })

function _G.toggleterm_safe()
	local mode = vim.api.nvim_get_mode().mode
	if mode == "n" then
		vim.cmd("ToggleTerm")
	end
end

vim.keymap.set("n", "<leader>t", toggleterm_safe, { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>p", ":Telescope projects<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "gi", function()
	require("telescope.builtin").lsp_implementations()
end, { noremap = true, silent = true })

vim.keymap.set("n", "gd", function()
	require("telescope.builtin").lsp_definitions()
end, { noremap = true, silent = true })

vim.keymap.set("n", "gt", function()
	require("telescope.builtin").lsp_type_definitions()
end, { noremap = true, silent = true })

vim.keymap.set("n", "gD", function()
	require("telescope.builtin").diagnostics()
end, { noremap = true, silent = true })

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Doc" })
