-- Global variables
return {
	mapleader          = " ",
	loaded_netrw       = 1,
	loaded_netrwPlugin = 1,
	treesitter         = { "rust", "zig", "c", "javascript", "python" },
	lsp_servers        = {
		"ada_ls","ts_ls", "pyright", "tailwindcss", "zls",
		"html", "cssls", "rust_analyzer", "lua_ls","texlab"
	},
	colorizer		   = {
		RGB      = true,
		RRGGBB   = true,
		names    = true,
		RRGGBBAA = true,
		rgb_fn   = true,
		hsl_fn   = true,
		css      = true,
		css_fn   = true,
		mode     = 'foreground',
	},
	toggleterm         = {
		size             = 6,
		open_mapping     = [[<C-_>]],
		hide_numbers     = true,
		shade_filetypes  = {},
		shade_terminals  = false,
		shading_factor   = 2,
		start_in_insert  = true,
		insert_mappings  = true,
		terminal_mappings = true,
		persist_size     = true,
		persist_mode     = true,
		direction        = "float",
		close_on_exit    = true,
		shell            = vim.o.shell,
		auto_scroll      = true,
	},
}
