local set = vim.keymap.set
local cmd = vim.cmd
local o = vim.opt

o.number = true
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.swapfile = false
o.hlsearch = true
o.scrolloff = 1
o.startofline = false
o.mouse = "a"
o.wrap = false
o.ignorecase = true
o.smartcase = true
o.showcmd = true
o.showmatch = true
o.history = 1000
o.wildmenu = true
o.undofile = true
o.undodir  = vim.fn.expand("~/.config/nvim/undo")
o.cursorline = true
o.wildmode = "longest:full,full"
o.wildignore = "*.docx,*.we*,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.svg,*.flv,*.img,*.xlsx"
o.clipboard = "unnamedplus"
o.termguicolors = true
o.backup = false
o.signcolumn = "yes"
o.writebackup = false
o.cmdheight = 0
o.laststatus = 0
vim.g.mapleader = " "

-- functions 
local function compile_tex()
  local tex_file = vim.fn.expand("%:p")
  os.execute("pdflatex -interaction=nonstopmode '" .. tex_file .. "' >/dev/null 2>&1")
end

local function open_zathura() 
  local pdf_path = vim.fn.expand("%:p:r") .. ".pdf"
  os.execute("zathura '" .. pdf_path .. "' >/dev/null 2>&1 &")
end

cmd([[syntax on]])
cmd([[filetype plugin indent on]])
cmd("cnoreabbrev q q!")
cmd("cnoreabbrev Q qall!")
cmd("cnoreabbrev w w!")
cmd("cnoreabbrev wq wq!")
set({"n","i","v"}, "<C-a>", "ggVG")
set({"n","i","v"}, "<A-j>", ":m .+1<CR>==")
set({"n","v"}, "<C-e>", ":source ~/.config/nvim/init.lua <CR>")

set("n", "J", ":m .+1<CR>==")
set("n", "K", ":m .-2<CR>==")
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set({"n","i"}, "<A-k>", ":m .-2<CR>==")
set("n", "<leader>j", ":%s//g<Left><Left>")
set("v", "<leader>j", ":s//g<Left><Left>")
set({"v","n"}, "<A-j>", ":m '>+1<CR>gv=gv")
set({"v","n"}, "<A-k>", ":m '<-2<CR>gv=gv")
set({"v","n"}, "gj", "G")
set({"v","n"}, "gk", "gg")
set({"n","v"}, "te", ":tabedit ")
set({"n","v"}, "<Tab>", ":tabnext<CR>")
set("v", "<", "<gv")
set("v", ">", ">gv")
set({"n","v"}, "<S-Tab>", ":tabprev<CR>")
set({"n","v"}, "E", ":e ")
set({"n","v"}, "vs", ":vsplit ")
set("n", "<A-/>", require("Comment.api").toggle.linewise.current)
set("v", "<A-/>", function() vim.api.nvim_feedkeys("gc", "x", false) end)
set("n", "<A-;>", compile_tex)
set("n", "<A-'>", open_zathura)




vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = compile_tex,
})



vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
		require("gruvbox").setup({
			undercurl = true,
			bold = true,
			italic = { strings = true, comments = true, operators = true, folds = true },
			inverse = true,
			contrast = "hard",
			transparent_mode = true,
			-- sign_column = "yes",  -- this makes gruvbox control the signcolumn bg
		})

        cmd("colorscheme gruvbox")
        require('Comment').setup()
        require('colorizer').setup()
		-- require('fzy.nvim').setup()
    end,
})

require("colorizer").setup({"*"}, {
    RGB = true, RRGGBB = true, names = true, RRGGBBAA = true,
    rgb_fn = true, hsl_fn = true, css = true, css_fn = true,
    mode = 'background',
})


local function fzy_finder(new_tab)
  local s, r = "/tmp/s.sh", "/tmp/r"
  local f = io.open(s, "w")
  f:write("find . -type f -not -path '*/.*' -not -path '*/node_modules/*' -not -path '*/target/*' -not -path '*/__pycache__/*' -not -path '*/.venv/*' -not -path '*/.cache/*' | fzy -l 6 > " .. r)
  f:close()
  os.execute("chmod +x " .. s)
  
  require('toggleterm.terminal').Terminal:new({
    cmd = s,
    direction = "horizontal",
    size = 6, 
    close_on_exit = true,
    on_exit = function()
      vim.schedule(function()
        local rf = io.open(r, "r")
        if rf then
          local file = rf:read("*line")
          rf:close()
          os.remove(r)
          if file and file ~= "" then
            vim.cmd(new_tab and "tabnew " .. file or "edit " .. file)
          end
        end
        os.remove(s)
      end)
    end,
  }):toggle()
end

set("n", "<leader>f", function() fzy_finder(true) end)
set("n", "<leader><C-f>", function() fzy_finder(false) end)



-- Terminal
require("toggleterm").setup({
	size = 6,
	open_mapping = [[<C-/>]],
	-- open_mapping = [[<C-_>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = false,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = true,
	direction = "horizontal", 
	close_on_exit = true,
	shell = vim.o.shell,
	auto_scroll = true,
})


local cmp = require("cmp")
cmp.setup({
  window = {
	completion = cmp.config.window.bordered({
	  border = {"╭","─","╮","│","╯","─","╰","│"},
	  winhighlight = "Normal:NormalFloat,FloatBorder:White,CursorLine:PmenuSel,Search:None",
	}),
	documentation = cmp.config.window.bordered({
		border = {"╭","─","╮","│","╯","─","╰","│"},
		winhighlight = "Normal:NormalFloat,FloatBorder:White,CursorLine:PmenuSel,Search:None",
	}),
  },
	mapping = cmp.mapping.preset.insert({
		-- ["<C-n>"] = cmp.mapping.select_next_item(),
		-- ["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
	})
})


local servers = { "pyright","tailwindcss","zls", "clangd","html","cssls","rust_analyzer" ,"texlab"}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Iterate over servers and setup each
for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		capabilities = capabilities
	}
end
