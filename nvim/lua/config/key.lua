local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Exit Neovim
map("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Force Quit All" })
map("n", "<C-a>", "ggVG", { desc = "Select All" })

-- Move lines using Alt + j/k
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Move between windows
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- Yank with system clipboard
map({ "n", "v" }, "y", '"+y', { desc = "Yank to system clipboard" })
map("n", "Y", '"+Y', { desc = "Yank line to system clipboard" })


-- Tab navigation
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Toggle file explorer
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Explorer" })

-- Reload config
map("n", "<leader>r", "<cmd>source $MYVIMRC<cr>", { desc = "Reload Config" })

-- Quick search and replace
map("n", "<leader>sr", ":%s//g<Left><Left>", { desc = "Search & Replace" })

-- Toggle comment
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Toggle Comment" })
map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle Comment" })

-- Buffer navigation
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close Buffer" })

-- LSP navigation
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Find References" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover Docs" })

-- Telescope shortcuts
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })

-- Close window
map("n", "<leader>c", "<cmd>close<cr>", { desc = "Close Window" })

-- Move lines inside blocks
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)


 -- Copy to system clipboard
map("v", "<leader>y", '"+y', { desc = "Yank to Clipboard" })
map("n", "<leader>Y", '"+yy', { desc = "Yank Line to Clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from Clipboard" })
map("n", "<leader>P", '"+P', { desc = "Paste before from Clipboard" })

-- Toggle lsp_lines
map("n", "<leader>l", function()
  local new_value = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_value, virtual_text = not new_value })
end, { desc = "Toggle LSP Lines" })


return {}

