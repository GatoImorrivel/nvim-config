return {
	"stevearc/conform.nvim",
	lazy = false,
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome", "prettier" },
				typescript = { "biome", "prettier" },
				python = { "black" },
				go = { "gofumpt" },
				sh = { "shfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
