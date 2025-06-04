return {
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
          },
          center = {
            { icon = '󰈙   ', desc = 'New File', action = 'enew' },
            { icon = '󰜮   ', desc = 'Update', action = 'Lazy update' },
            { icon = '❌  ', desc = 'Quit', action = 'q!' },
          },
        },
      })
    end,
  },

  -- PyWal colorscheme
  {
    "AlphaTechnolog/pywal.nvim",
    priority = 1000,
    config = function()
      require("pywal").setup()
    end,
  },

  -- Enhanced UI components
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = { command_palette = true },
    },
    dependencies = { "MunifTanjim/nui.nvim" },
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = {
          enabled = true,
          border = "rounded",
          win_options = {
            winblend = 10,
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
        select = {
          enabled = true,
          backend = { "telescope", "builtin" },
        },
      })
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "pywal",
        component_separators = { left = " ", right = "" },
        section_separators = { left = "", right = "" },
        icons_enabled = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { "filename", "branch", "diff", "diagnostics" },
        lualine_x = { "filetype" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },

  -- Buffer line
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({})
    end
  },

  -- Notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#000000",
        render = "minimal",
        stages = "fade_in_slide_out",
        timeout = 3000,
      })
      vim.notify = notify
      require("telescope").load_extension("notify")
    end,
  },

  -- Discord Rich Presence
  {
    "IogaMaster/neocord",
    event = "VeryLazy",
    config = function()
      require("neocord").setup({
        global_timer = true,
        logo = "NULL",
        logo_tooltip = "Pixvim",
        main_text = "Editing %filename%",
        line_number_text = "Line %line% out of %total_lines%",
        update_interval = 10,
        enable_line_number = false,
        blacklist = {},
        git = { enable = false },
        buttons = { enabled = false }
      })
    end,
  },

  -- Mason for managing LSP servers and tools
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
      local mason_registry = require("mason-registry")
      local servers = {
        -- Web Development
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "eslint-lsp",
        "html-lsp",
        "angular-language-server",
        "emmet-ls",
        "json-lsp",
        "stylelint-lsp",
        "prettier",
        "eslint_d",
        "js-debug-adapter",
        "deno",
        
        -- Python
        "pyright",
        "black",
        "ruff",
        "mypy",
        "isort",
        "debugpy",
        
        -- Rust
        "rust-analyzer",
        "rustfmt",
        "codelldb",
        
        -- Lua
        "lua-language-server",
        "luacheck",
        "stylua",
        
        -- C/C++
        "clangd",
        "clang-format",
        "cmake-language-server",
        
        -- Shell
        "shellcheck",
        "shfmt",
        "bash-language-server",
      }
      for _, server in ipairs(servers) do
        if not mason_registry.is_installed(server) then
          vim.cmd("MasonInstall " .. server)
        end
      end
    end,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Language server configurations
      local servers = {
        html = { filetypes = { "html", "htmldjango" } },
        cssls = { filetypes = { "css" } },
        ts_ls = { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" } },
        tailwindcss = {},
        pyright = {},
        gopls = {},
        rust_analyzer = {},
        clangd = {},
        svelte = {},
        dartls = {
          cmd = { "dart", "language-server" },
          filetypes = { "dart" },
          init_options = {
            closingLabels = true,
            outline = true,
            flutterOutline = true,
          }
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end

      -- Global mappings
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

      -- LSP keymaps on attach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end,
  },

  -- Enhanced LSP diagnostics
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({ virtual_text = false })
    end,
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html", "css", "javascript", "typescript", "tsx",
          "python", "rust", "c", "lua", "json", "yaml",
          "bash", "markdown", "prisma", "graphql", "scss",
          "go", "dart", "svelte"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Auto tag closing
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Enhanced completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
          }),
        },
        window = {
          completion = { border = "rounded" },
          documentation = { border = "rounded" },
        },
      })
    end,
  },

  -- Rust specific tools
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    config = function()
      local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
      
      require("rust-tools").setup({
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        tools = {
          inlay_hints = { auto = true },
          hover_actions = { auto_focus = true },
        },
      })
    end,
  },

  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },

  -- Crates.nvim for Rust dependency management
  {
    'saecki/crates.nvim',
    ft = { "toml" },
    config = function()
      require("crates").setup{
        cmp = { enabled = true }
      }
      require('cmp').setup.buffer({
        sources = {{ name = "crates" }}
      })
    end
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

  -- Better commenting
  {
    "numToStr/Comment.nvim",
    config = true,
  },

  -- Color highlighting and support
  {
    "NvChad/nvim-colorizer.lua",
    opts = { user_default_options = { mode = "background", names = false } },
  },

  -- Tailwind CSS support
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = true,
  },

  -- Markdown rendering
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    opts = {},
  },
}
