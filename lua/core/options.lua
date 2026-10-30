-- -- disable netrw:
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.o.number = true
vim.opt.rnu = true
vim.opt.signcolumn = "yes"

-- opts: none, single, rounded, solid, shadow, double
-- vim.o.winborder = "single"

vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true
vim.o.confirm = true

vim.o.scrolloff = 6
-- TODO: in 0.13 - try "scrolloffpad"

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
	end,
})
vim.opt.spelllang = { "en", "ru" }

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.shortmess:append("I")

local undodir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undodir, "p")
vim.opt.undofile = true
vim.opt.undodir = undodir

vim.opt.laststatus = 3
vim.opt.cmdheight = 0

-- vim.opt.showmode = false

-- -- default:
vim.opt.statusline =
	" %f [%{toupper(mode())}] %m %r%{%reg_recording() != '' ? ' [REC @' .. reg_recording() .. ']' : '' %}%=%{%v:lua.vim.diagnostic.status()%} %l:%c %p%% "

for _, severity in ipairs({ "Error", "Warn", "Info", "Hint" }) do
	vim.api.nvim_set_hl(0, "DiagnosticSign" .. severity, {
		bg = "NONE",
		update = true,
	})
end

-- -- no macro:
-- vim.opt.statusline = " %f %m %r%=%{%v:lua.vim.diagnostic.status()%} %l:%c %p%% "

vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
	},
})

vim.opt.fillchars = {
	eob = " ",
}

vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

vim.opt.autoindent = true
vim.opt.smartindent = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "> "

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
