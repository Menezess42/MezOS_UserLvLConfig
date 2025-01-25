return{
    {
        'ident-blankline.nvim',
        for_cat = 'general.extra',
        event = 'DeferredUIEnter',
        after = function (plugin)
            require('ibl').setup()
        end
    }
}
