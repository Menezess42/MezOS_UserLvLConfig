require('m42.plugins.nnpain')
require('m42.plugins.oilvim')
require('m42.plugins.highlight')
require('m42.plugins.rainbowDelimiter')

require('lze').load{
    {import = "m42.plugins.telescope", },
    {import = "m42.plugins.treesitter", },
    {import = "m42.plugins.completion", },
    {import = "m42.plugins.autopairs", },
    {import = "m42.plugins.lazydev",},
    {import = "m42.plugins.markdownprev",},
    {import = "m42.plugins.undotree",},
    {import = "m42.plugins.comment",},
    {import = "m42.plugins.indentblankline",},
    {import = "m42.plugins.vimSurround",},
    {import = "m42.plugins.fidget",},
    {import = "m42.plugins.lualine",},
    {import = "m42.plugins.gitsigns",},
    {import = "m42.plugins.wichKey",},
    {import = "m42.plugins.print",},
    {import = "m42.plugins.jupytext"},
    {
        "vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        'vim-dadbod-ui',
        dependencies = {
            { 'vim-dadbod', lazy = true },
            { 'vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql', 'sqlite' }, lazy = true }, -- Optional
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_env_variable_url = 'DATABASE_URL'
            vim.g.db_ui_env_variable_name = 'DATABASE_NAME'
        end,
    },
}
