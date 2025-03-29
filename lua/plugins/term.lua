return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				direction = "float", -- Open terminal in floating mode
				shade_terminals = true, -- Dim inactive terminals
				insert_mappings = true, -- Use terminal in insert mode
				start_in_insert = true, -- Automatically start in insert mode
				float_opts = {
					border = "curved", -- Use a curved border for aesthetics
				},
			})
		end,
	},
}
