local servers =  vim.g.lsp_servers
local caps = require('cmp_nvim_lsp').default_capabilities()
local lsp = require('lspconfig')

for _, s in ipairs(servers) do
	lsp[s].setup({
		capabilities = caps,
	})
end

lsp.clangd.setup{
	capabilities = caps,
    cmd = { "clangd", "--enable-config" }
}

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})

vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
    config = config or {}
	config.border = { "╭","─","╮","│","╯","─","╰","│" }
    return vim.lsp.handlers.hover(_, result, ctx, config)
end

vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, config)
    config = config or {}
	config.border = { "╭","─","╮","│","╯","─","╰","│" }
    return vim.lsp.handlers.signature_help(_, result, ctx, config)
end
