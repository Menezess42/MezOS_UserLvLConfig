return {
  {
    "benlubas/molten-nvim",
    for_cat = "general.always",    -- ou deixe sem categoria
    event = "VimEnter",            -- carrega assim que abrir o nvim
    after = function()
      vim.g.molten_image_provider = "image.nvim"
      -- suas outras configurações…
      print("✅ Molten carregado!")
    end,
  }
}
