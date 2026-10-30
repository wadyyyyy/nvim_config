local blink = require("blink.cmp")

-- Build fuzzy matcher
blink.build():wait()

blink.setup({
	keymap = {
		preset = "default",
	},

	completion = {
		documentation = {
			auto_show = false,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	fuzzy = {
		implementation = "rust",
	},

	cmdline = {
		enabled = true,
		keymap = {
			preset = "inherit",
		},
		completion = {
			menu = {
				auto_show = true,
			},
		},
	},
})
