local M = {}

M.config = function()
  -- Customization
  -- =========================================
  lvim.builtin.treesitter.matchup.enable = true
  lvim.builtin.treesitter.context_commentstring.enable = true
  -- treesitter is buggy :(
  lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } }
  lvim.builtin.treesitter.ensure_installed = { "json", "typescript", "javascript", "go", "python", "c", "cpp" }
  lvim.builtin.treesitter.ignore_install = {}
  lvim.builtin.treesitter.playground.enable = true
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

  --     -- Automatically jump forward to textobj, similar to targets.vim
  --     lookahead = true,

  --     keymaps = {
  --       -- You can use the capture groups defined in textobjects.scm
  --       ["ac"] = "@conditional.outer",
  --       ["ic"] = "@conditional.inner",

  --       ["as"] = "@statement.outer",
  --     },
  --   },
  --   move = {
  --     enable = true,
  --     set_jumps = true, -- whether to set jumps in the jumplist
  --     goto_next_start = {
  --       ["]s"] = "@statement.outer",
  --     },
  --     goto_previous_start = {
  --       ["[s"] = "@statement.outer",
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
  lvim.builtin.autopairs.active = true

  lvim.builtin.dashboard.custom_section["m"] = {
    description = { "  Marks              " },
    command = "Telescope marks",
  }

  -- Additional keybindings
  -- =========================================lvim.leader = "space"
  lvim.keys.normal_mode["Y"] = "y$"
  lvim.keys.visual_mode["p"] = [["_dP]]
  lvim.keys = vim.tbl_deep_extend("force", lvim.keys, {
    insert_mode = {
      ["<C-l>"] = "<C-o>$<cmd>silent! LuaSnipUnlinkCurrent<CR>",
      ["<C-j>"] = "<C-o>o<cmd>silent! LuaSnipUnlinkCurrent<CR>",
    },
  })
  -- WhichKey keybindings
  -- =========================================
  lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
  lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
  -- lvim.builtin.which_key.mappings.T.h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" }
  -- lvim.builtin.which_key.mappings.T.p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" }
  -- Autocommands
  -- =========================================

  --local luasnip = require "luasnip"
  --luasnip.config.set_config {
  --  history = true,
  --  updateevents = "TextChanged,TextChangedI",
  --  delete_check_events = "TextChanged", -- or maybe "InsertLeave"
  --  region_check_events = "CursorMoved", -- or maybe "InsertEnter"
  --}
  vim.cmd [[
  augroup CustomLuaSnip
    au!
    au TextChanged,InsertLeave * lua require'luasnip'.unlink_current_if_deleted()
  augroup end
]]
end
return M
