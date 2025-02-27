vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })

-- Telescope
vim.keymap.set("n", "<Leader>t", function()
	require("telescope.builtin").find_files()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>s", function()
	require("telescope.builtin").live_grep()
end, { noremap = true, silent = true })

-- Nvim-Tree
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Conform
vim.keymap.set("n", "<Leader>f", function()
	require("conform").format({ lsp_fallback = true })
end, { noremap = true, silent = true, desc = "Format Document" })
