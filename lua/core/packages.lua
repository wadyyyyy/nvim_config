vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("build_telescope_fzf", { clear = true }),
	callback = function(ev)
		if ev.data.spec.name ~= "telescope-fzf-native.nvim" then
			return
		end
		if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
			return
		end

		local result = vim.system({ "make" }, { cwd = ev.data.path, text = true }):wait()
		if result.code ~= 0 then
			error("Failed to build telescope-fzf-native.nvim:\n" .. (result.stderr or result.stdout or ""))
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/ydkulks/cursor-dark.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	{ src = "https://github.com/shortcuts/no-neck-pain.nvim" },
	{ src = "https://github.com/Eandrju/cellular-automaton.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },

	{ src = "https://github.com/smjonas/inc-rename.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/bkad/CamelCaseMotion" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/tpope/vim-dadbod" },
	{ src = "https://github.com/kristijanhusak/vim-dadbod-ui" },
	{ src = "https://github.com/kristijanhusak/vim-dadbod-completion" },
	{ src = "https://github.com/wadyyyyy/db_switcher.nvim" },
	{ src = "https://github.com/monaqa/dial.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	-- { src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
	{ src = "https://github.com/MagicDuck/grug-far.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/dchinmay2/clangd_extensions.nvim" },
	{ src = "https://github.com/linux-cultist/venv-selector.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/folke/persistence.nvim" },
	{ src = "https://github.com/ahmedkhalf/project.nvim" },
	{ src = "https://github.com/stevearc/quicker.nvim" },
	{ src = "https://github.com/dstein64/vim-startuptime" },
	{ src = "https://github.com/gbprod/yanky.nvim" },
})
