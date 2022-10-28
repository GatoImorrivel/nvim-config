require('packer-plugs')
require('nvim-conf')
require('mappings')
--require('statusbar.main')

--require('onedark').setup({
  --style = 'warmer'
--})
--require('onedark').load()

--require('statusbar.main').override_colors()

vim.o.background = "dark" -- or "light" for light mode
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    SignColumn = {bg = "#32302f"}
  },
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

require('lualine').setup({
  options = { 
    theme = 'gruvbox' ,
    section_separators = '', 
    component_separators = ''
  },
  extensions = {
    'nvim-tree'
  }
})

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
