return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "-" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 500,
			virt_text = true,
			virt_text_pos = "eol", -- 'overlay' | 'eol' | 'right_align'
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	},
}
