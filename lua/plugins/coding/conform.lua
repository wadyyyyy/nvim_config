require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		sql = { "pg_format" },
		pgsql = { "pg_format" },
		fish = { "fish_indent" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		python = { "ruff_organize_imports", "ruff_format" },
		go = { "gofmt" }, -- "goimports", if needed
		c = { "clang-format" },
		cpp = { "clang-format" },
		dockerfile = { "dockerfmt" },
	},

	formatters = {
		pg_format = {
			command = "pg_format",
			args = {
				"--keyword-case",
				"1",
				"--spaces",
				"2",
			},
			stdin = true,
		},

		shfmt = {
			prepend_args = {
				"-i",
				"2",
				"-ci",
			},
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format({
			bufnr = args.buf,
			lsp_format = "fallback",
		})
	end,
})
