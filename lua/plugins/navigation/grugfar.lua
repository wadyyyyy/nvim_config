require("grug-far").setup({
	headerMaxWidth = 80,
})

vim.api.nvim_create_user_command("GrugFar", function()
	require("grug-far").open()
end, {})

vim.api.nvim_create_user_command("GrugFarWithin", function()
	require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
end, {})

vim.keymap.set({ "n", "x" }, "<leader>sr", function()
	local grug = require("grug-far")
	local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")

	grug.open({
		transient = true,
		prefills = {
			filesFilter = ext and ext ~= "" and "*." .. ext or nil,
		},
	})
end, { desc = "Search and Replace (GrugFar)" })
