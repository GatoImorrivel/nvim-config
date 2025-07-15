return {
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				patterns = { "Cargo.toml", ".git", "package.json", "tsconfig.json", "pnpm-workspace.yaml" },
				detection_methods = { "pattern" },
				exclude_dirs = { ".cargo", "target", "node_modules", "dist" },
			})
		end,
	},
}
