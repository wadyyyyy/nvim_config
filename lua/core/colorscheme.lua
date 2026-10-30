local function match_signcolumn_background()
	local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = normal.bg })
end

-- vim.cmd.colorscheme("gruvbox")

vim.cmd.colorscheme("cursor-dark")
vim.api.nvim_set_hl(0, "Normal", {
	bg = "#141414",
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = match_signcolumn_background,
})
