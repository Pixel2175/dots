# DWL
dynamic window manager for wayland (dwm for wayland).

> **patches**:
- alwayscenter
- bar
- bar-notitle
- bar-recolr
- customfloat
- gaps
- hide-behind-fullscreen
- hide-behind-monocle
- hide-cursor-when-typing
- pertag
- restore-monitor
- smartborders
- swallow
- tablet-input
- warpcursor

[repo](https://codeberg.org/dwl)

# Neovim
options.lua, globals.lua, commands.lua, binds.lua, are just data files.
Neovim runs init.lua, which loads tables from other files; each table is looped and applied to vim.opt, vim.g, vim.cmd, keymaps, plugins, and LSP setup in order.
Everything is processed by simple for loops calling Neovim APIs.

Plugins setup and LSP are separated modules that run after core config is loaded.

I use two main functions (there may be more in the future):

> gdb function:
A simple but powerful function that opens GDB inside Neovim.
> fzy function:
Another simple but powerful function that opens an FZY window for searching files.

> **Plugins**:
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cord.nvim](https://github.com/vyfor/cord.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [neo-img](https://github.com/Skardyy/neo-img)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-colorizer.lua](https://github.com/Pixel2175/nvim-colorizer.lua)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [vim-closetag](https://github.com/alvan/vim-closetag)
- [vim-tpipeline](https://github.com/vimpostor/vim-tpipeline)

# Tmux
Minimal and flexible tiled and tabbed terminal pane manager configuration for Tmux.
[raw](https://codeberg.org/pi66/dots/raw/branch/main/tmux.conf)

# Sta
A simple monitoring app inspired by slstatus.
It adds a new feature: it can send an update signal instead of waiting for the delay countdown.

[repo](https://codeberg.org/pi66/sta)

# Colorscheme
gruvbox-hard fork but slightly muted and fully black bg.
It is used across the window manager, terminal, neovim, and even Krita to keep a consistent look.
applied system-wide using [Walrs](https://github.com/pixel2175/walrs).
> check `colorscheme` file for more details.
[raw](https://codeberg.org/pi66/dots/raw/branch/main/colorscheme)

# Preview

<h3 style="text-align: center;">DWL</h3>
<table>
  <tr>
    <td><img src="./screenshots/dwl-00.png" width="100%"></td>
    <td><img src="./screenshots/dwl-01.png" width="100%"></td>
  </tr>
</table>

<h3 style="text-align: center;">Neovim</h3>
<table>
  <tr>
    <td><img src="./screenshots/nvim-00.png" width="100%"></td>
    <td><img src="./screenshots/nvim-01.png" width="100%"></td>
  </tr>
</table>
