return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    notify.setup({
      background_colour = "#000000", -- يمكنك تغييره ليطابق الـ colorscheme
      render = "minimal", -- نمط بسيط للإشعارات
      stages = "fade_in_slide_out", -- تأثير ظهور جميل
      timeout = 3000, -- مدة الإشعار بالمللي ثانية
    })

    -- ربط nvim-notify كنظام الإشعارات الافتراضي لـ Neovim
    vim.notify = notify

    -- تكامل مع Telescope
    require("telescope").load_extension("notify")
  end,
}

