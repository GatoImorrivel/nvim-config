local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
capabilities = vim.tbl_deep_extend("force", capabilities, has_cmp and cmp_nvim_lsp.default_capabilities() or {})

return function(lspconfig)
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
				cargo = {
					allFeatures = true,
				},
				procMacro = {
					enable = true,
				},
				diagnostics = {
					enable = true,
				},
			},
		},
	})
end
