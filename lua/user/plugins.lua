local M = {}

M.config = function()
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
end
return M
