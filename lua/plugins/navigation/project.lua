require("project_nvim").setup({
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".venv" },
	show_hidden = true,
	silent_chdir = true,
})
