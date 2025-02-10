<<<<<<< HEAD
-- If this is vscode don't load these
if vim.g.vscode then
  return
else
require('keymaps')
require('plugins.lazy')
require('plugins.misc')
require('plugins.lualine')
require('options')
require('misc')
require('plugins.dap')
require('plugins.gitsigns')
require('plugins.tele')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.trouble')
require('plugins.zenmode')
require('plugins.nvimtree')
end
-- vim: ts=8 sts=2 sw=2 et
=======
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
>>>>>>> 39130aa (updating nvim)
