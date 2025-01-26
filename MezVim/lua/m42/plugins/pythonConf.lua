return {
    -- {
    --     "black",
    --     for_cat = "python",
    --     ft = "python",
    -- },
    {
        "ale",
        for_cat = "python",
        ft = "python",
        config = function()
            vim.g.ale_linters = {
                python = { "flake8", "pyflakes" },
            }
            vim.g.ale_fixers = {
                python = { "black" },
            }
            vim.g.ale_python_flake8_executable = "flake8"
            vim.g.ale_python_black_executable = "black"
        end,
    },
}
