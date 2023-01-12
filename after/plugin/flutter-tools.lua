require("flutter-tools").setup{} -- use defaults

--flutter:
vim.keymap.set("n", "<leader>dr", "<cmd>FlutterRun<CR>")
vim.keymap.set("n", "<leader>dd", "<cmd>FlutterDevices<CR>")
vim.keymap.set("n", "<leader>dq", "<cmd>FlutterQuit<CR>")
vim.keymap.set("n", "<leader>dpg", "<cmd>FlutterPubGet<CR>")
vim.keymap.set("n", "<leader>dpu", "<cmd>FlutterPubUpgrade<CR>")
vim.keymap.set("n", "<leader>dot", "<cmd>FlutterOutlineToggle<CR>")
vim.keymap.set("n", "<leader>drs", "<cmd>FlutterRestart<CR>")
vim.keymap.set("n", "<leader>drl", "<cmd>FlutterReload<CR>")
