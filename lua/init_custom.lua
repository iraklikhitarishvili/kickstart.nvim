-- spell checking
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }
-- globals for custom functions
vim.g.my_globals = {
  diagnostics = {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
  },
}
-- folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.opt.foldenable = false
vim.opt.foldtext = 'v:lua.my_fold_text()'
function _G.my_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local sub = vim.fn.trim(line)
  sub = vim.fn.substitute(sub, '/*|*/|{{{d=', '', 'g')
  sub = string.format('  %d lines: %s', vim.v.foldend - vim.v.foldstart + 1, sub)
  return vim.v.folddashes .. sub
end

-- custom lsp attach
function _G.lsp_attach(map)
  map('fb', function()
    vim.lsp.buf.format()
  end, '[F]ormat [B]uffer')
  map('td', function()
    vim.diagnostic.config(vim.g.my_globals.diagnostics)
    local my_globals = vim.g.my_globals
    my_globals.diagnostics.virtual_text = not my_globals.diagnostics.virtual_text
    vim.g.my_globals = my_globals
  end, '[T]oggle [D]iagnostics Text')
end
function _G.add_lsp(servers)
  servers.ts_ls = {}
  servers.tsp_server = {}
  servers.html = { filetypes = { 'html', 'gohtml' } }
  servers.cssmodules_ls = {}
end
