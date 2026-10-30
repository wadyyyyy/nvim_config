vim.g.db_ui_execute_on_save = false
vim.g.db_ui_use_nerd_fonts = true

-- see: https://github.com/wadyyyyy/db_switcher.nvim
require("db_switcher").setup({
	source = "core.settings.db_private",
	default = "sqlb",
})

vim.keymap.set("n", "<leader>Du", "<cmd>DBUIToggle<cr>", {
	desc = "Toggle DBUI",
})

vim.keymap.set("n", "<leader>Ds", "<cmd>DBS<cr>", {
	desc = "Select database",
})

vim.keymap.set("n", "<leader>Dr", "<cmd>DBSReload<cr>", {
	desc = "Reload database connections",
})

vim.keymap.set("n", "<leader>DE", "<cmd>%DB<cr>", {
	desc = "Execute SQL buffer",
})

vim.keymap.set("x", "<leader>DE", ":<C-u>'<,'>DB<cr>", {
	desc = "Execute selected SQL",
})
