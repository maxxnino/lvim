-- Neovim
-- =========================================
-- lvim.log.level = "debug"
lvim.format_on_save = false
lvim.lint_on_save = false
lvim.colorscheme = "darkplus"
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 7
vim.opt.timeoutlen = 300
vim.g.dashboard_disable_statusline = 0
vim.opt.pumblend = 10 -- Popup blend
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.list = true -- Show some invisible characters (tabs...

-- Customization
-- =========================================
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.context_commentstring.enable = true
-- treesitter is buggy :(
lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } }
lvim.builtin.treesitter.ensure_installed = { "json", "typescript", "javascript", "go", "python", "c", "cpp" }
lvim.builtin.treesitter.ignore_install = {}
-- lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "<C-n>",
    node_incremental = "<C-n>",
    scope_incremental = "<C-s>",
    node_decremental = "<C-r>",
  },
}
-- lvim.builtin.treesitter.textobjects = {
--   select = {
--     enable = true,
--
--     -- Automatically jump forward to textobj, similar to targets.vim
--     lookahead = true,
--
--     keymaps = {
--       -- You can use the capture groups defined in textobjects.scm
--       ["al"] = "@loop.outer",
--       ["il"] = "@loop.inner",
--       ["ac"] = "@conditional.outer",
--       ["ic"] = "@conditional.inner",
--
--       ["as"] = "@statement.outer",
--     },
--   },
--   move = {
--     enable = true,
--     set_jumps = true, -- whether to set jumps in the jumplist
--     goto_next_start = {
--       ["]s"] = "@conditional.inner",
--     },
--     goto_previous_start = {
--       ["[s"] = "@conditional.inner",
--     },
--   },
-- }
-- lvim.builtin.treesitter.query_linter = {
--   enable = true,
--   use_virtual_text = true,
--   lint_events = { "BufWrite", "CursorHold" },
-- }

lvim.builtin.dashboard.active = true
lvim.builtin.project.active = true
lvim.builtin.lualine.active = true
lvim.builtin.telescope.active = true
lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shell = "pwsh -NoLogo"

lvim.builtin.dashboard.custom_section["m"] = {
  description = { "  Marks              " },
  command = "Telescope marks",
}

vim.g.italic_comments = true
lvim.plugins = {
  { "LunarVim/Colorschemes" },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
    event = "BufRead",
  },
  -- {
  --   "nvim-treesitter/playground",
  --   event = "BufRead",
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   event = "BufRead",
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require "user.blankline"
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}

-- Additional keybindings
-- =========================================lvim.leader = "space"
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.visual_mode["p"] = [["_dP]]
lvim.keys.insert_mode["<c-s>"] = "<cmd>lua vim.lsp.buf.signature_help()<cr>"

-- WhichKey keybindings
-- =========================================
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
-- lvim.builtin.which_key.mappings.T.h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" }
-- lvim.builtin.which_key.mappings.T.p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" }
-- Autocommands
-- =========================================
