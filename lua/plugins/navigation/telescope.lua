require("telescope").setup({
	defaults = {

		mappings = {
			i = {
				["<C-v>"] = require("telescope.actions").select_vertical,
				["<C-x>"] = require("telescope.actions").select_horizontal,
			},
			n = {
				["<C-v>"] = require("telescope.actions").select_vertical,
				["<C-x>"] = require("telescope.actions").select_horizontal,
			},
		},
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		layout_strategy = "bottom_pane",
	},
	-- pickers = {
	-- 	find_files = {
	-- 		hidden = true,
	-- 		no_ignore = true,
	-- 	},
	-- },
	pickers = {
		find_files = {
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--no-ignore",
				"--glob",
				"!.git",
				"--glob",
				"!.venv",
				"--glob",
				"!__pycache__",
			},
		},
	},
	extensions = { fzf = {} },
})

vim.list_extend(require("telescope.config").values.vimgrep_arguments, {
	"--hidden",
	"--no-ignore",
	"--glob",
	"!.git",
	"--glob",
	"!.venv",
	"--glob",
	"!__pycache__",
})

require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep (Telescope)" })
vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Open buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fM", builtin.man_pages, { desc = "Man pages" })

vim.keymap.set("n", "<leader>ut", function()
	builtin.colorscheme({ enable_preview = true })
end, { desc = "Choose colorscheme" })

require("telescope").load_extension("projects")

vim.keymap.set("n", "<leader>fp", function()
	require("telescope").extensions.projects.projects({
		prompt_title = "Projects",
		layout_config = {
			width = 0.6,
			height = 0.8,
		},
	})
end, { desc = "Find projects" })

vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document Symbols" })
vim.keymap.set("n", "<leader>fS", builtin.lsp_dynamic_workspace_symbols, { desc = "Goto Workspace Symbol" })
vim.keymap.set("n", "<leader>fx", builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fc", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "NeoVim config" })
vim.keymap.set("n", "<leader>sc", function()
	builtin.live_grep({ cwd = vim.fn.stdpath("config") })
end, { desc = "Search in NeoVim config" })

vim.keymap.set("n", "<leader>fX", function()
	builtin.diagnostics({ bufnr = 0 })
end, { desc = "Buffer Diagnostics" })

vim.keymap.set("n", "<leader>fR", builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Marks" })
vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Jumplist" })
vim.keymap.set("n", "<leader>fC", builtin.commands, { desc = "Commands" })
vim.keymap.set("n", '<leader>f"', builtin.registers, { desc = "Registers" })
vim.keymap.set("n", "<leader>s/", builtin.current_buffer_fuzzy_find, { desc = "Search in current buffer (Telescope)" })

vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { desc = "References" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "Diagnostics" })
