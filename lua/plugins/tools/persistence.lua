require("persistence").setup({
	dir = vim.fn.stdpath("state") .. "/sessions/",
	need = 1,
	branch = true,
})

local persistence = require("persistence")

vim.keymap.set("n", "<leader>qs", function()
	persistence.load()
end, { desc = "Load session" })

vim.keymap.set("n", "<leader>qS", function()
	persistence.select()
end, { desc = "Select session" })

vim.keymap.set("n", "<leader>ql", function()
	persistence.load({ last = true })
end, { desc = "Load last session" })

vim.keymap.set("n", "<leader>qd", function()
	persistence.stop()
end, { desc = "Stop session saving" })
