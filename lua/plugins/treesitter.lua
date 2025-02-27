return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true }, -- Improved syntax highlighting
			indent = { enable = true }, -- Smarter indentation
			autotag = { enable = true }, -- Auto-close HTML/JSX tags
		})
	end,
}
