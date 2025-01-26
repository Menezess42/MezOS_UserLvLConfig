return {
    {
        "nvim-lspconfig",
        ft = "python",
        config = function ()
            local lspconfig = require("lspconfig")
            lspconfig.pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            pytflake = {enabled = true},
                            flake8 = {enabled = false},
                            black = {enable = true},
                            jedi = {enable = true},
                        },
                    },
                },
            })
        end,
    },
    {
        "nvim-dap",
        ft = "python",
        config = function ()
            local dap = require('dap')
            dap.adapters.python = {
                type = "executable",
                command = "python",
                args = {"-m", "debugpy.adapter"}
            }
            dap.configurations.python ={
                {
                    type = "python",
                    request = "launch",
                    name = "launch file",
                    program = "${file}",
                    pythonpath = function ()
                        return os.getenv("VIRTUAL_ENV") and os.getenv("VIRTUAL_ENV").. "/bin/python" or "python"
                    end,
                },
            }
        end,
    },

}

