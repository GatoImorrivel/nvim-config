return function(lspconfig)
	lspconfig.clangd.setup({
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	})
end
