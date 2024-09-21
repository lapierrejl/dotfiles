-- require('telescope').load_extension('harpoon')
require('telescope').load_extension('git_worktree')
local fb_actions = require('telescope._extensions.file_browser.actions')
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.65,
      horizontal = {
        size = {
          width = 0.5,
          height = 0.5,
        },
      },
    },
  mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-p>"] = fb_actions.goto_parent_dir,
        },
      },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension 'file_browser')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = true,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sS', require('telescope.builtin').git_status, { desc = '' })
vim.keymap.set('n', '<leader>sm', ":Telescope harpoon marks<CR>", { desc = 'Harpoon [M]arks' })
vim.keymap.set("n", "<Leader>sr", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
vim.keymap.set("n", "<Leader>sR", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", silent)
vim.keymap.set("n", "<Leader>sn", "<CMD>lua require('telescope').extensions.notify.notify()<CR>", silent)
vim.keymap.set("n", "<space>ff", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<space>f", ":NvimTreeToggle<CR>")
vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>", {noremap=false})
