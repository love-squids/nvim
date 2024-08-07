vim.g.mapleader = " "
-- vim.keymap.set("n", ";", ":")
-- vim.keymap.set("n", ":", ";")

vim.keymap.set("n", "cv", ":")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<End>", vim.cmd.w)
vim.keymap.set("i", "<PageDown>", "<Esc>")
vim.keymap.set("n", "<PageDown>", "<C-d>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)
-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", function()
  if (vim.bo.filetype == "dart") then
    local startTime = os.clock();
    local file = vim.fn.expand("%");
    print("flutter formating " .. file);
    vim.cmd([[
    :w!
    ]])
    local output = vim.fn.system("flutter format " .. file);
    print(output)
    vim.cmd([[
    :e!
    :w!
    ]])
    print("Finished formating " .. file .. " in " .. os.clock() - startTime);
  else
    vim.lsp.buf.format()
    print("Formated " .. vim.bo.filetype .. " file");
  end
end)

radu_prevCwd = vim.fn.getcwd()
local nvimconfig = vim.fn.stdpath("config");
vim.keymap.set("n", "<F3>", function()
  if (vim.fn.getcwd() == nvimconfig)
  then
    vim.cmd.cd(radu_prevCwd)
  else
    radu_prevCwd = vim.fn.getcwd()
    vim.cmd.cd(vim.fn.stdpath("config"))
  end
  print("New Current Directory: ", vim.fn.getcwd())
end)

vim.keymap.set("n", "<F4>", ":so<CR>")
vim.keymap.set("n", "<Home>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<Home>k", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set('n', '<leader>vv', function() Echo_caca() end)
vim.cmd('source ' .. nvimconfig ..'\\lua\\radu\\remap.vim')
