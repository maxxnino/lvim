-- Neovim
-- =========================================
lvim.format_on_save = false
lvim.leader = " "
lvim.colorscheme = "darkplus"
-- lvim.debug = false
-- lvim.log.level = "warn"
require("user.neovim").config()
require("user.builtin").config()
require("user.plugins").config()
require("user.null_ls").config()
