-- lazy.nvim
return {
{
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    open_mapping = [[<C-_>]], -- Ctrl + / for the first terminal
  },
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal

    -- First terminal toggle (Ctrl + /)
    local first_term = Terminal:new({ id = 1 })
    vim.keymap.set('n', '<C-_>', function()
      first_term:toggle()
    end, { desc = "Toggle first terminal" })

    -- Second terminal toggle (Ctrl + \)
    local second_term = Terminal:new({ id = 2 })
    vim.keymap.set('n', '<C-\\>', function()
      second_term:toggle()
    end, { desc = "Toggle second terminal" })

    -- Close the focused terminal with Ctrl + /
    vim.keymap.set('t', '<C-_>', [[<C-\><C-n><cmd>ToggleTerm<CR>]], {
      noremap = true,
      silent = true,
      desc = "Close focused terminal",
    })
  end,
},

{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
presets = {
    command_palette = true, -- position the cmdline and popupmenu together
   },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    }
}
,{
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- Automatically update Mason registry
  config = true,
},
{
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",   -- LSP suggestions
      "hrsh7th/cmp-buffer",     -- Buffer suggestions
      "hrsh7th/cmp-path",       -- File path suggestions
      "hrsh7th/cmp-cmdline",    -- Command-line suggestions
      "L3MON4D3/LuaSnip",       -- Snippets support
      "saadparwaiz1/cmp_luasnip", -- Snippets integration
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Expand snippets
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept selected item
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Use completion in command-line mode
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Example: Setup Python LSP (pyright)
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- Add additional LSP servers here
    end,
  },

  -- Mason for managing LSP servers
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- Auto-update Mason registry
    config = true,
  },
{
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
	  theme = 'doom',
	    config = {
    header = {
 [[                                              ]],
 [[                                              ]],
 [[                                              ]],
 [[                                              ]],
 [[                                              ]],
 [[                                              ]],
 [[     ▄▄▄▄▄▄▄▄ ▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄▄ ▄▄▄▄      ]],
 [[    █        █    █  █▄█  █        █    █     ]],
 [[    █    ▄   █    █       █    ▄▄▄▄█    █     ]],
 [[    █   █▄█  █    █       █   █▄▄▄▄█    █     ]],
 [[    █    ▄▄▄▄█    ██     ██    ▄▄▄▄█    █     ]],
 [[    █   █    █    █       █   █▄▄▄▄█    █▄▄▄  ]],
 [[    █   █    █    █   ▄   █        █        █ ]],
 [[    █▄▄▄█    █▄▄▄▄█▄▄█ █▄▄█▄▄▄▄▄▄▄▄█▄▄▄▄▄▄▄▄█ ]],
 [[                                              ]],
 [[                                              ]],
 [[                                              ]],
 [[                                             ]],
 [[                                             ]],
    }, --your header
    center = {
      {
        icon = '   ',
        desc = 'New File',
        key = 'n',
        keymap = '    ',
        key_format = ' %s',
        action = 'enew',
      },
      {
        icon = '   ',
        desc = 'Update',
        key = 'u',
        keymap = '    ',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'Lazy update'
      },
      {
	icon = '❌  ',
	desc = 'quit',
	key = 'q',
	keymap = '    ',
	key_format = ' %s',
	action = 'q!',
      }
    },

  }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
},
	-- PyWal
  {
    "AlphaTechnolog/pywal.nvim",
    name = "pywal", -- Optional: Assign a name for clarity
    priority = 1000, -- Load this plugin with high priority
    config = function()
      require("pywal").setup()
    end,
  },
-- Discord Status Show
{
    "IogaMaster/neocord",
    config = function()
      require("neocord").setup({
        -- General options
        logo = "auto",
        logo_tooltip = nil,
        main_image = "language",
        client_id = "XXXXXXXXXXXXXXXXXXX", -- Your Discord Application ID
        log_level = "warn",
        debounce_timeout = 10,
        blacklist = {},
        file_assets = {},
        show_time = true,
        global_timer = true,

        -- Rich Presence text options
        editing_text = "Editing %s",
        file_explorer_text = "Browsing %s",
        git_commit_text = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text = "Reading %s",
        workspace_text = "Working on %s",
        line_number_text = "Line %s out of %s",
        terminal_text = "Using Terminal",
      })
    end,
  },
   -- colorizer | show colors in preview
   {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        mode = "background",
        names = false,
      },
    },
  },
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        width = 25, -- Adjust this value to set the desired width
      },
    })
    vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>")
  end
}
}
