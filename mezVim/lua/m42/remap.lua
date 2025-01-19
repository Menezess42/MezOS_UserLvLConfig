vim.g.mapleader = " "

-- ezy explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- No neck pain
vim.keymap.set("n", "nnp", vim.cmd.NoNeckPain)


-- Ctrl+C Ctrl+V
vim.keymap.set("v", "<leader>c", '"+y', { desc = "Copiar para o clipboard do sistema" })
vim.keymap.set("n", "<leader>C", '"+yy', { desc = "Copiar linha para o clipboard do sistema" })
vim.keymap.set("n", "<leader>v", '"+p', { desc = "Colar do clipboard do sistema depois do cursor" }) 
vim.keymap.set("n", "<leader>V", '"+P', { desc = "Colar do clipboard do sistema antes do cursor" })


-- keep paste buffer
vim.keymap.set("v", "p", '"_dP', { desc = "Colar sem alterar o buffer de colagem" })



