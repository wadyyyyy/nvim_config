require("no-neck-pain").setup({
	width = 140,
	minSideBufferWidth = 10,
})

vim.keymap.set("n", "<leader>un", "<cmd>NoNeckPain<cr>", {
	desc = "Toggle NoNeckPain",
})
