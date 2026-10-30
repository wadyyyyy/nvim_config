require("gitsigns").setup()

local gs = require("gitsigns")

vim.keymap.set("n", "]h", function()
	gs.nav_hunk("next")
end, { desc = "Next Git Hunk" })

vim.keymap.set("n", "[h", function()
	gs.nav_hunk("prev")
end, { desc = "Previous Git Hunk" })

vim.keymap.set("n", "<leader>ghq", gs.setqflist, { desc = "Send Hunks to qflist" })

vim.keymap.set({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
vim.keymap.set({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
vim.keymap.set("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
vim.keymap.set("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
vim.keymap.set("n", "<leader>ghp", gs.preview_hunk_inline, { desc = "Preview Hunk Inline" })
vim.keymap.set("n", "<leader>ghb", function()
	gs.blame_line({ full = true })
end, { desc = "Blame Line" })
vim.keymap.set("n", "<leader>ghB", function()
	gs.blame()
end, { desc = "Blame Buffer" })
vim.keymap.set("n", "<leader>ghd", gs.diffthis, { desc = "Diff This" })
vim.keymap.set("n", "<leader>ghD", function()
	gs.diffthis("~")
end, { desc = "Diff This ~" })
