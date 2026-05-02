require('neo-img').setup({})
require('mini.pairs').setup({})
require('Comment').setup()
require('gitsigns').setup()
require('colorizer').setup({ "*" }, {
    RGB      = true,
    RRGGBB   = true,
    names    = true,
    RRGGBBAA = true,
    rgb_fn   = true,
    hsl_fn   = true,
    css      = true,
    css_fn   = true,
    mode     = 'background',
})

require("toggleterm").setup({
    size             = 6,
    open_mapping     = [[<C-_>]],
    hide_numbers     = true,
    shade_filetypes  = {},
    shade_terminals  = false,
    shading_factor   = 2,
    start_in_insert  = true,
    insert_mappings  = true,
    terminal_mappings = true,
    persist_size     = true,
    persist_mode     = true,
    direction        = "float",
    close_on_exit    = true,
    shell            = vim.o.shell,
    auto_scroll      = true,
})

local cmp = require("cmp")

cmp.setup({
    window = {
        completion = cmp.config.window.bordered({
            border      = border,
            winhighlight = "Normal:NormalFloat,FloatBorder:White,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
            border      = border,
            winhighlight = "Normal:NormalFloat,FloatBorder:White,CursorLine:PmenuSel,Search:None",
        }),
    },
    formatting = {
        fields = { "abbr", "kind" },
        format = function(_, vim_item)
            vim_item.menu   = nil
            vim_item.detail = nil
            return vim_item
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<CR>"]  = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer"   },
        { name = "path"     },
    },
})

require("nvim-treesitter").install({
    "rust",
    "c",
    "javascript",
    "zig",
    "python",
})
