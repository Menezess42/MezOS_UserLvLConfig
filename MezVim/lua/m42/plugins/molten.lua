-- return {
--   {
--     "benlubas/molten-nvim",
--     dependencies = {
--       "3rd/image.nvim"
--     },
--     for_cat = "general.molten",
--     ft = { "python", "ipynb", "markdown" },
--     build = ":UpdateRemotePlugins",
--     after = function(plugins)
--       require("molten").setup({})
--     end,
--   }
-- }
-- File: lua/m42/plugins/molten.lua
-- Integração do plugin molten-nvim em m42
return {
  {
    "benlubas/molten-nvim",
    requires = {
      "samodostal/image.nvim",  -- plugin de renderização de imagens
      "nvim-lua/plenary.nvim"  -- utilitários Lua para Neovim
    },
    for_cat = 'general.molten',  -- categoria definida no flake
    ft = { "markdown", "jupyter" },  -- carrega em arquivos Markdown e Jupyter
    cmd = { "MoltenStart", "MoltenStop" },  -- comandos do plugin
    -- event = "BufReadPost",  -- carregamento pós leitura de buffer
    event = "DeferredUIEnter",
    after = function(plugin)
      require('molten').setup({
        -- Configurações opcionais, consulte a documentação para mais opções
        image = {
          backend = "imagemagick",  -- usa imagemagick instalado via Nix
        },
        -- pinte as células de Jupyter como imagens
        display = {
          syntax = true,
          prompt = false,
        },
      })
    end,
  },
}
