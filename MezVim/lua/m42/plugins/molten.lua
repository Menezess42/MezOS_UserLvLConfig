return {
  {
    "benlubas/molten-nvim",
    name = "molten",
    for_cat = "dev.python",
    ft = { "python", "ipynb", "markdown" },
    build = ":UpdateRemotePlugins",
    config = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false

      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*.ipynb",
        callback = function()
          vim.cmd("MoltenInit")
        end,
      })

      vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "[M]olten [I]nit" })
      vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>", { desc = "[M]olten [E]val op", silent = true })
      vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { desc = "[M]olten eval [L]ine", silent = true })
      vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>", { desc = "[M]olten [V]isual", silent = true })
      vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "[M]olten [D]elete cell", silent = true })
      vim.keymap.set("n", "<leader>mo", ":MoltenEnterOutput<CR>", { desc = "[M]olten [O]utput", silent = true })
    end,
  },
  {
    "3rd/image-nvim", -- Este pode continuar aqui se desejar, apenas para configurar
    config = function()
      require("image").setup({
        backend = "kitty",
        integrations = {
          markdown = true,
          neorg = true,
        },
        max_width = 100,
        max_height = 12,
        max_height_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      })
    end,
  },
}
