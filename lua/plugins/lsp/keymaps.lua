local map = vim.keymap.set
local lsp = vim.lsp.buf

map({ "n", "x" }, "<leader>ca", lsp.code_action, { desc = "Code Action" })
map("n", "<leader>cc", vim.lsp.codelens.run, { desc = "Run CodeLens" })
map("n", "<leader>cr", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Rename Symbol" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "<leader>cR", "<cmd>lua Snacks.rename.rename_file()<cr>", { desc = "Rename File" })
map("n", "gd", lsp.definition, { desc = "Goto Definition" })
map("n", "gD", lsp.declaration, { desc = "Goto Declaration" })
map("n", "gI", lsp.implementation, { desc = "Goto Implementation" })
map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

map("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>", {
	desc = "Switch Source/Header (clangd)",
})

local diagnostic_goto = function(next, severity)
	return function()
		vim.diagnostic.jump({
			count = (next and 1 or -1) * vim.v.count1,
			severity = severity and vim.diagnostic.severity[severity] or nil,
			float = true,
		})
	end
end
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

map("n", "<leader>cA", function()
	lsp.code_action({ context = { only = { "source" } } })
end, { desc = "Source Action" })

map("n", "<leader>uh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
