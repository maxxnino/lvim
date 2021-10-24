local M = {}

M.config = function()
  vim.opt.relativenumber = true
  vim.opt.wrap = true
  vim.opt.timeoutlen = 200
  vim.o.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  vim.o.foldlevel = 4
  vim.o.foldtext =
    [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
  vim.opt.fillchars = {
    vert = "▕", -- alternatives │
    fold = " ",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
  }
  vim.o.foldnestmax = 3
  vim.o.foldminlines = 1
  vim.opt.cmdheight = 1
  vim.g.dashboard_enable_session = 0
  vim.g.dashboard_disable_statusline = 1
  vim.opt.pumblend = 10
  vim.opt.joinspaces = false
  vim.opt.list = true
  vim.g.italic_comments = true
  vim.g.italic_keywords = true
  vim.g.italic_functions = true
  vim.g.italic_keyword = true
  vim.g.italic_function = true
end

return M
