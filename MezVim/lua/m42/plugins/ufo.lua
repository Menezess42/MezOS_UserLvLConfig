return {
  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",  -- dependência para funcionamento assíncrono
    for_cat = 'general.extra',
    event = "deferreduienter",  -- carrega após a iu ser inicializada
    after = function(plugin)
      -- configurações de dobra
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldenable = true

      -- mapeamentos de teclas para manipulação de dobras
      vim.keymap.set('n', 'zr', require('ufo').openallfolds, { desc = "abrir todas as dobras" })
      vim.keymap.set('n', 'zm', require('ufo').closeallfolds, { desc = "fechar todas as dobras" })
      vim.keymap.set('n', 'zk', function()
        -- se não houver janela de visualização, utiliza o hover do lsp
        if vim.fn.win_getid() == 0 then
          vim.lsp.buf.hover()
        end
      end, { desc = "visualizar dobra" })

      -- inicialização do ufo
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          -- prioriza lsp e indentação como provedores de dobra
          return { 'lsp', 'indent' }
        end,
      })
    end,
  },
}
