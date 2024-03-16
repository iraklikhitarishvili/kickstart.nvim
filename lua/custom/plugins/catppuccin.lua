return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup(
      {
        flavour = "mocha",
        term_colors = true,
        color_overrides = {
          mocha = {
            base = "#1a1a1a",
            mantle = "#1a1a1a",
            crust = "#1f1f1f",
          },
        },
      }
    )
    vim.cmd.colorscheme 'catppuccin'
  end
}