local detail = false

require("oil").setup({
	default_file_explorer = false,

	columns = {
		-- "icon",
		"size",
		"mtime",
	},

	buf_options = {
		buflisted = false,
		bufhidden = "hide",
	},

	-- win_options = {
	-- 	wrap = true,
	-- 	signcolumn = "true",
	-- 	cursorcolumn = false,
	-- },

	view_options = {
		show_hidden = true,
		natural_order = "fast",
		case_insensitive = true,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
	},

	keymaps = {
		["q"] = "actions.close",
		["gd"] = {
			desc = "Toggle file detail view",
			callback = function()
				detail = not detail
				if detail then
					require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
				else
					require("oil").set_columns({ "icon" })
				end
			end,
		},
		["<C-q>"] = {
			"actions.send_to_qflist",
			opts = {
				target = "qflist",
				action = "r",
			},
			desc = "Send files to quickfix",
		},
		["<C-v>"] = "actions.select_vsplit",
		["<C-s>"] = "actions.select_split",
	},

	delete_to_trash = true,
	skip_confirm_for_simple_edits = false,

	constrain_cursor = "name",
})

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", {
	desc = "Open Oil",
})
