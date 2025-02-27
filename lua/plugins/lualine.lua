return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"branch",
						icon = "", -- No Git branch icon
					},
					{
						function()
							local git_status = vim.b.gitsigns_status_dict
							return git_status
									and (git_status.added + git_status.changed + git_status.removed > 0)
									and "*"
								or ""
						end,
					},
				},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					{
						function()
							local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 }) -- Get LSPs for the current buffer
							if #buf_clients == 0 then
								return ""
							end
							local lsp_names = {}
							for _, client in ipairs(buf_clients) do
								table.insert(lsp_names, client.name)
							end
							return table.concat(lsp_names, ", ") -- Active LSPs only
						end,
					},
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
