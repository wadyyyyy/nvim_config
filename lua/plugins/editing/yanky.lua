require("yanky").setup({
	ring = {
		history_length = 50,
		storage = "shada",
	},
})

vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)", {
	desc = "Yank text",
})

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", {
	desc = "Put after cursor",
})

vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", {
	desc = "Put before cursor",
})

vim.keymap.set("n", "<C-p>", "<Plug>(YankyPreviousEntry)", {
	desc = "Previous yank",
})

vim.keymap.set("n", "<C-n>", "<Plug>(YankyNextEntry)", {
	desc = "Next yank",
})

vim.keymap.set("n", "<leader>Y", "<cmd>YankyRingHistory<cr>", {
	desc = "Yank history",
})
