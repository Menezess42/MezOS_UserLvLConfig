vim.g.mapleader = " "

-- ezy explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- No neck pain
vim.keymap.set("n", "nnp", vim.cmd.NoNeckPain)


-- Ctrl+C Ctrl+V
vim.keymap.set({"n" , "v"}, "<leader>c", '"+y', { desc = "Copiar para o clipboard do sistema" })
vim.keymap.set({"n","v"}, "<leader>C", '"+yy', { desc = "Copiar linha para o clipboard do sistema" })
vim.keymap.set({"n","v"}, "<leader>v", '"+p', { desc = "Colar do clipboard do sistema depois do cursor" }) 
vim.keymap.set({"n","v"}, "<leader>V", '"+P', { desc = "Colar do clipboard do sistema antes do cursor" })
--
--

vim.keymap.set("n", "<leader>q", ":Bdelete<CR>")

