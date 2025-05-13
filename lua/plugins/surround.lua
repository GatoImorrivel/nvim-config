return {
	"kylechui/nvim-surround",
	version = "*", -- Always use the latest version
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end,
}
