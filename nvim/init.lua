vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup(require("plugins"))
require("options")       -- Load general settings (options)
require("keymaps")       -- Load keymaps
require("autocmds")      -- Load autocommands
require("mason").setup()
