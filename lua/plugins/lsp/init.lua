require("plugins.lsp.options")
require("plugins.lsp.keymaps")
require("plugins.lsp.servers")

vim.lsp.enable({
	"lua_ls",
	"postgres_lsp",
	"clangd",
	"gopls",
	"jsonls",
	"taplo",
	"dockerls",
	"yamlls",
	"pyright",
	"ruff",
})
require("clangd_extensions").setup({})
