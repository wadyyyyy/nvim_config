require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
	},
})

local parsers = {
	"lua",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
	"python",
	"go",
	"gomod",
	"gowork",
	"gosum",
	"sql",
	"bash",
	"json",
	"yaml",
	"toml",
	"html",
	"css",
	"javascript",
	"typescript",
	"c",
	"cpp",
	"dockerfile",
	"git_config",
	"gitignore",
	"diff",
	"regex",
	"make",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		pcall(vim.treesitter.start, ev.buf)
	end,
})

local select = require("nvim-treesitter-textobjects.select").select_textobject

local textobjects = {
	f = "function",
	c = "class",
	a = "parameter",
	i = "conditional",
	l = "loop",
	-- b = "brackets",
	B = "block",
	m = "call",
	s = "assignment",
	["/"] = "comment",
	r = "return",
}

for key, object in pairs(textobjects) do
	for prefix, range in pairs({ a = "outer", i = "inner" }) do
		local lhs = prefix .. key
		local query = "@" .. object .. "." .. range

		vim.keymap.set({ "x", "o" }, lhs, function()
			select(query, "textobjects")
		end, { desc = "Treesitter: " .. query })
	end
end

local move = require("nvim-treesitter-textobjects.move")

local movements = {
	f = "@function.outer",
	c = "@class.outer",
	a = "@parameter.inner",
	i = "@conditional.outer",
	l = "@loop.outer",
	-- b = "@brackets.outer",
	B = "@block.outer",
	m = "@call.outer",
	s = "@assignment.outer",
	["/"] = "@comment.outer",
	r = "@return.outer",
}

for key, query in pairs(movements) do
	local mappings = {
		["[" .. key] = move.goto_previous_start,
		["]" .. key] = move.goto_next_start,
		["[" .. key:upper()] = move.goto_previous_end,
		["]" .. key:upper()] = move.goto_next_end,
	}

	for lhs, action in pairs(mappings) do
		vim.keymap.set({ "n", "x", "o" }, lhs, function()
			action(query, "textobjects")
		end, { desc = "Treesitter: " .. lhs })
	end
end

local swap = require("nvim-treesitter-textobjects.swap")

vim.keymap.set("n", "<leader>a", function()
	swap.swap_next("@parameter.inner")
end, { desc = "Treesitter: Swap next parameter" })

vim.keymap.set("n", "<leader>A", function()
	swap.swap_previous("@parameter.inner")
end, { desc = "Treesitter: Swap previous parameter" })

local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_opposite)

vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true })

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
