return {
	"mfussenegger/nvim-lint",
	config = function()
		local linter = require("lint")
		linter.linters_by_ft = {
			javascript = {
				"biomejs",
			},
			typescript = {
				"biomejs",
			},
			javascriptreact = {
				"biomejs",
			},
			typescriptreact = {
				"biomejs",
			},
		}
		vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
			callback = function()
				local lint_status, lint = pcall(require, "lint")
				if lint_status then
					lint.try_lint()
				end
			end,
		})
	end,
}
