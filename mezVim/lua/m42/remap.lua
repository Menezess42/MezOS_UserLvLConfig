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


vim.keymap.set("n", "<leader>q", ":Bdelete<CR>")


-- change the way of movin lines down and up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Moves Line Down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Moves Line Up' })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Scroll Down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Scroll Up' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Next Search Result' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Previous Search Result' })

-- see help sticky keys on windows
vim.cmd([[command! W w]])
vim.cmd([[command! Wq wq]])
vim.cmd([[command! WQ wq]])
vim.cmd([[command! Q q]])

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


