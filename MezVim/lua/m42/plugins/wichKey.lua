return {
    {
        "which-key.nvim",
        for_cat = 'general.extra',
        event = "DeferredUIEnter",
        after = function (plugin)
            require('which-key').setup({
                win = {
                    border = "rounded", -- Borda arredondada
                    position = "bottom", -- Posição: pode ser "bottom" ou "top"
                    margin = { 1, 0, 1, 0 }, -- Margens ao redor da janela
                    adding = { 1, 1, 1, 1 }, -- Padding interno da janela
                    winblend = 10, -- Transparência (0-100)
                },
                -- layout = {
                --     height = { min = 4, max = 25 }, -- Altura da janela
                --     width = { min = 20, max = 50 }, -- Largura da janela
                --     spacing = 3, -- Espaçamento entre colunas
                --     align = "left", -- Alinhamento das colunas
                -- },
            })
            require('which-key').add {
                { "<leader><leader>", group = "buffer commands" },
                { "<leader><leader>_", hidden = true },
                { "<leader>c", group = "[c]ode" },
                { "<leader>c_", hidden = true },
                { "<leader>d", group = "[d]ocument" },
                { "<leader>d_", hidden = true },
                { "<leader>g", group = "[g]it" },
                { "<leader>g_", hidden = true },
                { "<leader>m", group = "[m]arkdown" },
                { "<leader>m_", hidden = true },
                { "<leader>r", group = "[r]ename" },
                { "<leader>r_", hidden = true },
                { "<leader>s", group = "[s]earch" },
                { "<leader>s_", hidden = true },
                { "<leader>t", group = "[t]oggles" },
                { "<leader>t_", hidden = true },
                { "<leader>w", group = "[w]orkspace" },
                { "<leader>w_", hidden = true },
            }
        end,
    }
}
