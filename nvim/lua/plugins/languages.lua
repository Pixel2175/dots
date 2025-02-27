return {
  -- Rust tools
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    config = function()
      local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'  -- Adjust for your OS
      
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
  
  -- TypeScript tools
  {
    "jose-elias-alvarez/typescript.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = true,
  },
}
