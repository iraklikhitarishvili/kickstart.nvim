return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      term_colors = true,
      color_overrides = {
        mocha = {
          base = '#131313',
          mantle = '#131313',
          crust = '#1a1a1a',
        },
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}

