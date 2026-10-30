require("bufferline").setup({
	options = {
		persist_buffer_sort = true,
		show_buffer_icons = false,
		separator_style = { "", "" },
		show_buffer_close_icons = false,
		show_close_icon = false,
		indicator = {
			style = "none",
		},
		always_show_bufferline = false,
		modified_icon = "[+] ",
		left_trunc_marker = "< ",
		right_trunc_marker = "> ",
		diagnostics = "nvim_lsp",
		diagnostics_update_on_event = true, -- use nvim's diagnostic handler
		close_command = function(buf)
			require("snacks").bufdelete(buf)
		end,
		right_mouse_command = function(buf)
			require("snacks").bufdelete(buf)
		end,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "x " or (e == "warning" and "! " or "i ")
				s = s .. n .. sym
			end
			return s
		end,
	},
	-- -- old:
	-- highlights = function(defaults)
	-- 	local highlights = vim.deepcopy(defaults.highlights)
	-- 	highlights.fill.bg = highlights.background.bg
	-- 	return highlights
	-- end,
	highlights = function(defaults)
		local highlights = vim.deepcopy(defaults.highlights)
		local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg

		for _, hl in pairs(highlights) do
			if type(hl) == "table" then
				hl.bg = bg
			end
		end

		return highlights
	end,
})

local map = vim.keymap.set
map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Buffers to the Right" })
map("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Delete Buffers to the Left" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bi", function()
	Snacks.bufdelete.invisible()
end, { desc = "Delete Invisible Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
map("n", "<leader>b[", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Left" })
map("n", "<leader>b]", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Right" })
