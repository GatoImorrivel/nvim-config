return {
	"stevearc/conform.nvim",
	lazy = false,
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome", "biome-check", "biome-organize-imports" },
				typescript = { "biome", "biome-check", "biome-organize-imports" },
				prisma = { "biome", "biome-check", "biome-organize-imports" },
				proto = { "buf" },
				python = { "black" },
				go = { "gofumpt" },
				sh = { "shfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt", lsp_format = "fallback" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
