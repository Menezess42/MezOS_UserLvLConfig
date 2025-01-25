return {
    {
        "indent-blankline.nvim",
        for_cat = 'general.extra',
        event = "DeferredUIEnter",
        after = function(plugin)
            -- Configuração básica do indent-blankline
            require("ibl").setup()

            -- Adicionando destaque em arco-íris
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require "ibl.hooks"
            -- Registrar os grupos de destaque para o esquema de cores
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            -- Configurar o indent-blankline com os destaques definidos
            require("ibl").setup {
                indent = {
                    highlight = highlight,
                },
            }
        end,
    },
}
