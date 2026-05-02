require('neo-img').setup({})
require('mini.pairs').setup({})
require('Comment').setup()
require('colorizer').setup({ "*" }, vim.g.colorizer )
require("toggleterm").setup(vim.g.toggleterm)
require("nvim-treesitter").install(vim.g.treesitter)
require('gitsigns').setup({ preview_config = { border = 'rounded' } })

_G.gs = require('gitsigns')
local cmp = require("cmp")

cmp.setup({
    window = {
        completion = cmp.config.window.bordered({
			border       = { "╭","─","╮","│","╯","─","╰","│" },
            winhighlight = "Normal:NormalFloat,FloatBorder:White,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
			border       = { "╭","─","╮","│","╯","─","╰","│" },
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
