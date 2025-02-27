return {
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
}

