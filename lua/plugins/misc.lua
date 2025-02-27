return {
	{
		"GatoImorrivel/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			vim.cmd("colorscheme everforest")
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Always use the latest version
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}
