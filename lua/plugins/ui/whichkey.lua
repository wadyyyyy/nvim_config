require("which-key").setup({
	icons = {
		mappings = false,
		keys = {},
	},
	-- preset = "helix",
	win = {
		border = "single",
	},
	spec = {
		{ "<leader>b", group = "buffers" },
		{ "<leader>f", group = "find" },
		{ "<leader>s", group = "search" },
		{ "<leader>g", group = "git" },
		{ "<leader>gh", group = "hunks" },
		{ "<leader>q", group = "sessions" },
		{ "<leader>x", group = "diagnostics / lists" },
		{ "<leader>c", group = "code" },
		{ "<leader>D", group = "databases" },
		{ "<leader>y", group = "yank" },
		{ "<leader>u", group = "ui" },
		{ "<leader>d", group = "debug" },
		{ "gs", group = "surround", mode = { "n", "x" } },
		{ "gr", group = "lsp actions", mode = { "n", "x" } },
		{ "<leader><tab>", group = "tabs" },
	},
})

vim.keymap.set("n", "<leader>?", function()
	require("which-key").show()
end, { desc = "Show Keymaps" })
