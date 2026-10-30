require("render-markdown").setup({
	enabled = true,
})

vim.keymap.set("n", "<leader>um", function()
	require("render-markdown").toggle()
end, {
	desc = "Toggle Markdown rendering",
})
