local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<End>a", mark.add_file)
vim.keymap.set("n", "<End>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<End>y", function() ui.nav_file(1) end)
vim.keymap.set("n", "<End>u", function() ui.nav_file(2) end)
vim.keymap.set("n", "<End>i", function() ui.nav_file(3) end)
vim.keymap.set("n", "<End>o", function() ui.nav_file(4) end)
vim.keymap.set("n", "<End>p", function() ui.nav_file(5) end)


