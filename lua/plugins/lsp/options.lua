require("lazydev").setup()

-- Advertise Blink's richer completion protocol to every server.  This enables
-- snippets, completion-item documentation, and additional completion details
-- when a server supports them.
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

local virtual_text = false

vim.diagnostic.config({
	virtual_text = virtual_text,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "single",
		source = true,
	},
})

vim.keymap.set("n", "<leader>ul", function()
	virtual_text = not virtual_text
	vim.diagnostic.config({ virtual_text = virtual_text })
end, { desc = "Toggle diagnostic virtual text" })

vim.lsp.codelens.enable(true)

vim.lsp.inlay_hint.enable(false)
