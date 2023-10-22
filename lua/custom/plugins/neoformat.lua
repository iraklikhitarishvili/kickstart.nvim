-- File: lua/custom/plugins/autopairs.lua

return {
  "sbdchd/neoformat",
  init = function()
      vim.g.neoformat_try_node_exe = 1
    end,
}
