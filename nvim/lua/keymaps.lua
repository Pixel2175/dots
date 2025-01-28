
-- Map <Leader>p to open Fzf command search
vim.api.nvim_set_keymap('n', '<Leader>p', ':Commands<CR>', { noremap = true, silent = true })

-- Configure terminal on open
--vim.api.nvim_create_autocmd("TermOpen", {
-- pattern = "*",
-- callback = function()
--   vim.opt_local.number = false
--   vim.opt_local.relativenumber = false
--   vim.opt_local.signcolumn = 'no'
--   vim.cmd('startinsert')
-- end,
--})

-- Create floating terminal window
--local function create_terminal()
-- local width = vim.api.nvim_get_option("columns")
-- local height = vim.api.nvim_get_option("lines")
-- local win_height = math.ceil(height * 0.7)
-- local win_width = math.ceil(width * 0.7)
-- local row = math.ceil((height - win_height) / 2)
-- local col = math.ceil((width - win_width) / 2)
--
-- local buf = vim.api.nvim_create_buf(false, true)
-- vim.api.nvim_open_win(buf, true, {
--   style = 'minimal',
--   relative = 'editor',
--   width = win_width,
--   height = win_height,
--   row = row,
--   col = col,
--   border = 'rounded'
-- })
-- return buf
--end

-- Toggle terminal command
--vim.api.nvim_create_autocmd("User", {
-- pattern = "ToggleTerminal",
-- callback = function()
--   if vim.bo.buftype == 'terminal' then
--     vim.cmd('close')
--   else
--     local buf = create_terminal()
--     vim.fn.termopen(vim.o.shell)
--   end
-- end,
--})

-- Create custom command for terminal toggle
--vim.api.nvim_create_user_command('ToggleTerminal', function()
 -- vim.cmd('doautocmd User ToggleTerminal')
--end, {})

-- Map Ctrl+/ to toggle terminal
--vim.keymap.set({'n', 't'}, '<C-_>', ':ToggleTerminal<CR>', { noremap = true, silent = true })



-- keymaps.lua
-- This file contains default LazyVim keymaps
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move text up and down
keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

-- Insert mode navigation
keymap.set("i", "<C-h>", "<Left>", opts)
keymap.set("i", "<C-l>", "<Right>", opts)
keymap.set("i", "<C-j>", "<Down>", opts)
keymap.set("i", "<C-k>", "<Up>", opts)

-- LSP
keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
keymap.set("n", "gd", vim.lsp.buf.definition, opts)
keymap.set("n", "K", vim.lsp.buf.hover, opts)
keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
keymap.set("n", "<space>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
keymap.set("n", "gr", vim.lsp.buf.references, opts)
keymap.set("n", "<space>f", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap.set("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap.set("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- NvimTree
keymap.set("n", "<leader>e", ":Neotree<CR>", opts)

--Terminal
--keymap.set("n", "<leader>e", ":<CR>", opts)

-- options.lua
-- This file contains default LazyVim options
local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                          -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,                       -- minimal number of screen columns to keep to the left and right of the cursor
  guifont = "monospace:h17",              -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- autocmds.lua
-- This file contains default LazyVim autocommands
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- Don't auto comment new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor position
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    vim.cmd('silent! normal! g`"zv')
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Disable diagnostics in node_modules
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/node_modules/*",
  command = "lua vim.diagnostic.disable(0)",
})

-- Check if file changed when its window is focused, more eager than 'autoread'
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})

-- Show notification on file change
autocmd("FileChangedShellPost", {
  pattern = "*",
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})
