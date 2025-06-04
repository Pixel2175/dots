-- Set leader key to space (set this early)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  print("Lazy.nvim installed successfully!")
end
vim.api.nvim_create_autocmd("FileType", {
    pattern = "html,css,javascript,rust,python,lua,go,*",
    command = "setlocal tabstop=4 shiftwidth=4 expandtab"
})


vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim to load plugins
require("lazy").setup({
  -- Import plugins from the lua/plugins directory
  { import = "plugins" },
  { import = "config" },
}, {
  -- Lazy.nvim options
  install = {
    colorscheme = { "pywal" },
  },
  checker = {
    enabled = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
require("dap.health").check()
