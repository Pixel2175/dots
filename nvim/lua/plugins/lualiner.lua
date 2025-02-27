return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "pywal",
      component_separators = { left = " ", right = "" },
      section_separators = { left = "", right = "" },
      icons_enabled = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {  },
      lualine_c = { "filename","branch", "diff", "diagnostics" },

      lualine_x = { "filetype" },
      lualine_y = {  },
      lualine_z = {  },
    },
  },
}

