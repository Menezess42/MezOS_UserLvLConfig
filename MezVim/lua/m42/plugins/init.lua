require('m42.plugins.oilvim')
require('m42.plugins.nnpain')
require('lze').load{
    {import = "m42.plugins.telescope", },
    {import = "m42.plugins.treesitter", },
    {import = "m42.plugins.completion", },
    {import = "m42.plugins.autopairs", },
    {import = "m42.plugins.lazydev"},
    {import = "m42.plugins.markdownprev"},
    {import = "m42.plugins.undotree"},
    {import = "m42.plugins.comment"},
    -- {import = "m42.plugins.indentblankline"},
    {
        'ident-blankline.nvim',
        for_cat = 'general.extra',
        event = 'DeferredUIEnter',
        after = function (plugin)
            require('ibl').setup()
        end
    },
}
