return{
  -- Plugin rainbow-delimiters com lazy loading
    {
        "HiPhish/rainbow-delimiters.nvim",
        for_cat = 'general.extra',
        event = "DeferredUIEnter",
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            -- Configurações de destaque
            vim.g.rainbow_delimiters = { highlight = highlight }
        end,
    },
}
