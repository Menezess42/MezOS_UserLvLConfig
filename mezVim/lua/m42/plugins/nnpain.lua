require("no-neck-pain").setup({})

-- ativar no neck pain automaticamente
vim.api.nvim_create_autocmd("vimEnter", {
	callback = function()
		vim.cmd("NoNeckPain")
	end,
})
