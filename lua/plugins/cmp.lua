local api = vim.api
local cmp_ui = {
	cmp = {
		icons_left = false, -- only for non-atom styles!
		style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
		abbr_maxwidth = 60,
		format_colors = {
			tailwind = false, -- will work for css lsp too
			icon = "󱓻",
		},
	},
}
local atom_styled = cmp_ui.cmp.style == "atom" or cmp_ui.cmp.style == "atom_colored"
local fields = (atom_styled or cmp_ui.icons_left) and { "kind", "abbr", "menu" } or { "abbr", "kind", "menu" }

local function format_color(entry, item, kind_txt)
	local entryItem = entry:get_completion_item()
	local color = entryItem.documentation
	local icon = cmp_ui.format_colors.icon .. " "

	if color and type(color) == "string" and color:match("^#%x%x%x%x%x%x$") then
		local hl = "hex-" .. color:sub(2)

		if #api.nvim_get_hl(0, { name = hl }) == 0 then
			api.nvim_set_hl(0, hl, { fg = color })
		end

		item.kind = ((cmp_ui.icons_left and icon) or (" " .. icon)) .. kind_txt
		item.kind_hl_group = hl
		item.menu_hl_group = hl
	end
end

return {
	{
		"L3MON4D3/LuaSnip", -- Snippet engine
		version = "2.*", -- Use latest v2 version
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets", -- Predefined snippets
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load() -- Load friendly-snippets
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					fields = fields,
					format = function(entry, item)
						local icons = require("icons.lspkind")
						local icon = icons[item.kind] or ""
						local kind = item.kind or ""

						if atom_styled then
							item.menu = kind
							item.menu_hl_group = "LineNr"
							item.kind = " " .. icon .. " "
						elseif cmp_ui.icons_left then
							item.menu = kind
							item.menu_hl_group = "CmpItemKind" .. kind
							item.kind = icon
						else
							item.kind = " " .. icon .. " " .. kind
							item.menu_hl_group = "comment"
						end

						if kind == "Color" and cmp_ui.format_colors.tailwind then
							format_color(entry, item, (not (atom_styled or cmp_ui.icons_left) and kind) or "")
						end

						--if #item.abbr > cmp_ui.abbr_maxwidth then
						--item.abbr = string.sub(item.abbr, 1, cmp_ui.abbr_maxwidth) .. "…"
						--end

						return item
					end,

					window = {
						completion = {
							scrollbar = false,
							side_padding = atom_styled and 0 or 1,
							winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder",
							border = atom_styled and "none" or "single",
						},

						documentation = {
							scrollbar = false,
							border = "single",
							winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
						},
					},
				},
			})
		end,
	},
}
