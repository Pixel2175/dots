return {
  -- Code formatting and linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- JavaScript/TypeScript
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint_d,
          
          -- Python
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.diagnostics.ruff,
          null_ls.builtins.diagnostics.mypy,
          
          -- Rust
          null_ls.builtins.formatting.rustfmt,
          
          -- Lua
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.luacheck,
          
          -- C/C++
          null_ls.builtins.formatting.clang_format,
          
          -- Shell
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.diagnostics.shellcheck,
        },
      })
    end,
  },
}
