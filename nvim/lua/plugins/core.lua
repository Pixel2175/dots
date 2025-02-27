return {
  -- Mason for managing LSP servers
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
      -- Ensure the required servers are installed
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
        
        -- JavaScript/TypeScript
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
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
  },
  
  -- Mason-lspconfig for better LSP integration
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },
  
  -- Web Development
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html", "css", "javascript", "typescript", "tsx",
          "python", "rust", "c", "lua", "json", "yaml",
          "bash", "markdown", "prisma", "graphql", "scss"
        },
        highlight = { enable = true },
        indent = { enable = true },
        --autotag = { enable = true }, -- Auto close HTML/JSX tags
      })
    end,
  },
	{
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup()
  end
},
  
  -- Auto close HTML/JSX tags
  {
   "windwp/nvim-ts-autotag",
config = function()
  require('nvim-ts-autotag').setup()
end,

  },
  
  -- Tailwind CSS support
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = true,
  },
}
