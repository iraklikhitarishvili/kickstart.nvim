return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config=function()
    vim.keymap.set(
      'n', '<leader>fbh', require('telescope').extensions.file_browser.file_browser,
      { desc = '[F]ile [B]rowser [H]ome' }
    )
    vim.keymap.set('n', '<leader>fbc',
      function() require('telescope').extensions.file_browser.file_browser { cwd = vim.fn.expand "%:p:h" } end,
      { desc = '[F]ile [B]rowser [C]urrent directory' }
    )
  end
}
