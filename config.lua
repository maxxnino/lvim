-- Neovim
-- =========================================
lvim.format_on_save = true
lvim.lint_on_save = false
lvim.colorscheme = "gruvbox-material"
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 5
vim.g.dashboard_disable_statusline = 0
vim.opt.pumblend = 10 -- Popup blend
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.list = true -- Show some invisible characters (tabs...

-- Customization
-- =========================================
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.telescope.active = true
lvim.builtin.treesitter.ensure_installed = { "zig", "json", "typescript", "javascript", "go", "python", "c", "cpp" }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = false
lvim.builtin.treesitter.incremental_selection = {
	enable = true,
	keymaps = {
		init_selection = "<C-n>",
		node_incremental = "<C-n>",
		scope_incremental = "<C-s>",
		node_decremental = "<C-r>",
	},
}
lvim.builtin.treesitter.query_linter = {
	enable = true,
	use_virtual_text = true,
	lint_events = { "BufWrite", "CursorHold" },
}

-- Additional Plugins
-- =========================================
-- vim.g.tokyonight_italic_comments = false
-- vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_show_eob = 0
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_better_performance = 1
lvim.plugins = {
	-- { "LunarVim/Colorschemes" },
	{ "sainnhe/gruvbox-material" },
	-- { "folke/tokyonight.nvim" },
	{
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
		event = "BufRead",
	},
	-- {
	-- 	"nvim-treesitter/playground",
	-- 	event = "BufRead",
	-- },
}

-- Additional keybindings
-- =========================================lvim.leader = "space"
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.visual_mode["p"] = [["_dP]]
lvim.keys.insert_mode["<c-s>"] = "<cmd>lua vim.lsp.buf.signature_help()<cr>"

-- WhichKey keybindings
-- =========================================
lvim.builtin.which_key.mappings["j"] = { ":TSHighlightCapturesUnderCursor<cr>", "TSP" }

-- Autocommands
-- =========================================
