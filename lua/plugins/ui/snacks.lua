require("snacks").setup({
	bigfile = { enabled = true },
	quickfile = { enabled = true },
	image = {
		enabled = true,
		doc = {
			enabled = true,
			inline = true,
			float = true,
		},
	},
})

if vim.fn.executable("lazygit") == 1 then
	vim.keymap.set("n", "<leader>gg", function()
		Snacks.lazygit({ cwd = Snacks.git.get_root() })
	end, { desc = "Lazygit (Root Dir)" })

	vim.keymap.set("n", "<leader>gG", function()
		Snacks.lazygit()
	end, { desc = "Lazygit (cwd)" })
end

vim.keymap.set("n", "<leader>.", function()
	Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })

vim.keymap.set("n", "<leader>S", function()
	Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })

vim.keymap.set("n", "<leader>dps", function()
	Snacks.profiler.scratch()
end, { desc = "Profiler Scratch Buffer" })
