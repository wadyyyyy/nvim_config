vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 20
vim.g.netrw_keepdir = 0
vim.g.netrw_sort_by = "exten"

local function set_tree_highlight()
	vim.api.nvim_set_hl(0, "netrwTreeBar", { fg = "#5c5c5c" })
	vim.api.nvim_set_hl(0, "NetrwTreeGlyph", { link = "netrwTreeBar" })
end

set_tree_highlight()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_tree_highlight })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function(event)
		vim.opt_local.conceallevel = 2
		vim.opt_local.concealcursor = "nv"

		vim.schedule(function()
			if not vim.api.nvim_buf_is_valid(event.buf) or vim.bo[event.buf].filetype ~= "netrw" then
				return
			end
			vim.api.nvim_buf_call(event.buf, function()
				vim.cmd("syntax match NetrwTreeGlyph /|/ containedin=netrwTreeBar conceal cchar=│")
			end)
		end)
	end,
})
