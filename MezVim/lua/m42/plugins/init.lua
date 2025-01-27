require('m42.plugins.nnpain')
require('m42.plugins.oilvim')
require('m42.plugins.highlight')
require('m42.plugins.rainbowDelimiter')

require('lze').load{
    {import = "m42.plugins.telescope", },
    {import = "m42.plugins.treesitter", },
    {import = "m42.plugins.completion", },
    {import = "m42.plugins.autopairs", },
    {import = "m42.plugins.lazydev"},
    {import = "m42.plugins.markdownprev"},
    {import = "m42.plugins.undotree"},
    {import = "m42.plugins.comment"},
    {import = "m42.plugins.indentblankline"},
    {import = "m42.plugins.vimSurround"},
    {import = "m42.plugins.fidget"},
    {import = "m42.plugins.lualine"},
    {import = "m42.plugins.gitsigns"},
    {import = "m42.plugins.wichKey"},
    -- {import = "m42.plugins.pythonConf"}
}
