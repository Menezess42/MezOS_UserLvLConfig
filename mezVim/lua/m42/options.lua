vim.o.relativenumber = true
vim.o.number = true
vim.o.termguicolors = true

--- tabs and shits
vim.opt.list=true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.smarttab=true
vim.opt.cpoptions:append('I')
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
-- stops line wrapping from being confusing
vim.o.breakindent = true
-- save undo history
vim.o.undofile = true

-- case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- set highlight on search
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Derease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menu, preview, noselect'

-- minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 27

-- Enable mouse mode
vim.o.mouse='a'

vim.api.nvim_create_autocmd("fileType", {
    desc = "remove formatoptions",
    callback = fucntion()
    vim.opt.formatoptions:remove({"c", "r", "o"})
end,
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {clear = true})
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

