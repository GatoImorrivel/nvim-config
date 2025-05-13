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
