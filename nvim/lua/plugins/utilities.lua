return {
  -- File explorer
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
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
    end,
  },


	  -- Dashboard customization
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('dashboard').setup({
        theme = 'doom',
        config = {
          header = {
 [[                                                 ]],
 [[                                                 ]],
 [[                                                 ]],
 [[                                                 ]],
 [[                                                 ]],
 [[                                                 ]],
 [[      ██████╗  ██╗ ██╗ ██╗ ███████╗ ██╗          ]],
 [[      ██╔══██╗ ██║ ██║ ██║ ██╔════╝ ██║          ]],
 [[      ██████╔╝ ██║  ████╔╝ █████╗   ██║          ]],
 [[      ██╔═══╝  ██║ ██╔═██╗ ██╔══╝   ██║          ]],
 [[      ██║      ██║ ██║ ██║ ███████╗ ███████╗     ]],
 [[      ╚═╝      ╚═╝ ╚═╝ ╚═╝ ╚══════╝ ╚══════╝     ]],
 [[                                                 ]],
 [[                                                 ]],
 [[                                                 ]],
 [[                                                 ]],
 [[                                                 ]],
          }, --your header
          center = {
            { icon = '󰈙   ', desc = 'New File', key = 'n', action = 'enew' },
            { icon = '󰜮   ', desc = 'Update', key = 'u', action = 'Lazy update' },
            { icon = '❌  ', desc = 'Quit', key = 'q', action = 'q!' },
          },
        },
      })
    end,
  },



  -- Noice for better command line UI
 {
   "folke/noice.nvim",
   event = "VeryLazy",
   opts = {
     presets = { command_palette = true },
   },
   dependencies = { "MunifTanjim/nui.nvim" },
 },


 {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({})
  end,
},

  -- Neocord for Discord rich presence
  {
    "IogaMaster/neocord",
    config = function()
      require("neocord").setup({
        main_image = "language",
        show_time = true,
        editing_text = "Editing %s",
      })
    end,
  },

  -- Colorizer for better color preview
  {
    "NvChad/nvim-colorizer.lua",
    opts = { user_default_options = { mode = "background", names = false } },
  },

   -- PyWal for theming
  {
    "AlphaTechnolog/pywal.nvim",
    priority = 1000,
    config = function()
      require("pywal").setup()
    end,
  },
 
  -- Terminal integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-_>]],
	start_in_insert = true,
	hide_numbers = true,
	shade_terminals = true,
        direction = "horizontal",
	size = 10,
        float_opts = {
          border = "curved",
        },
      })
    end,
  },
  
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      require("telescope").load_extension("fzf")
      
      -- Keymaps
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
      vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
    end,
  },
  
  -- Better commenting
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  
  -- Color highlighting for hex colors
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "html", "javascript", "typescript", "jsx", "tsx" })
    end,
  },
}
