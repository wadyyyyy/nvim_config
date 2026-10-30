require("todo-comments").setup()

local todo = require("todo-comments")

vim.keymap.set("n", "]t", todo.jump_next, { desc = "Next TODO comment" })
vim.keymap.set("n", "[t", todo.jump_prev, { desc = "Previous TODO comment" })

vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", {
	desc = "TODO comments",
})
