local servers = { "ada_ls","ts_ls", "pyright", "tailwindcss", "zls", "html", "cssls", "rust_analyzer", "lua_ls","texlab" }
local caps = require('cmp_nvim_lsp').default_capabilities()
local lsp = require('lspconfig')

for _, s in ipairs(servers) do
	lsp[s].setup({
		capabilities = caps,
	})
end

require('lspconfig').clangd.setup{
    cmd = { "clangd", "--enable-config" }
}

lsp.nim_langserver.setup({
    capabilities = caps,
    on_init = function(client, _)
        client.handlers["window/showMessage"] = function() end
        client.handlers["window/logMessage"]  = function() end
    end,
})

lsp.ada_ls.setup({
	cmd = { "ada_language_server" }
})

lsp.lua_ls.setup({
	capabilities = caps,
})

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})

vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
    config = config or {}
    config.border = border
    return vim.lsp.handlers.hover(_, result, ctx, config)
end

vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, config)
    config = config or {}
    config.border = border
    return vim.lsp.handlers.signature_help(_, result, ctx, config)
end
