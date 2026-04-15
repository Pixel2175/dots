for k, v in pairs(require("options")) do
    vim.opt[k] = v
end

for k, v in pairs(require("globals")) do
    vim.g[k] = v
end

for _, v in pairs(require("commands")) do
    vim.cmd(v)
end

vim.pack.add(require("packages"))

require("functions")
require("setup")
require("lsp")

for _, v in pairs(require("binds")) do
    vim.keymap.set(v[1], v[2], v[3])
end
