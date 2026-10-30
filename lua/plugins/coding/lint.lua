local lint = require("lint")

lint.linters_by_ft = {
	go = { "golangcilint" },
	cpp = { "cppcheck" },
	c = { "cppcheck" },
	sh = { "bash" },
	fish = { "fish" },
}

local pending = {}

local function debounce_lint(args)
	local bufnr = args.buf
	pending[bufnr] = (pending[bufnr] or 0) + 1
	local generation = pending[bufnr]

	vim.defer_fn(function()
		if pending[bufnr] ~= generation then
			return
		end
		pending[bufnr] = nil
		if vim.api.nvim_buf_is_valid(bufnr) then
			vim.api.nvim_buf_call(bufnr, lint.try_lint)
		end
	end, 100)
end

vim.api.nvim_create_autocmd({
	"BufReadPost",
	"BufWritePost",
	"InsertLeave",
}, {
	callback = debounce_lint,
})
