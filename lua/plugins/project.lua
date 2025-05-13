return {
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				patterns = { "Cargo.toml", ".git", "package.json", "tsconfig.json", "pnpm-workspace.yaml" },
			})
		end,
	},
}
