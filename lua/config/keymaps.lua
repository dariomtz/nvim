-- Keymaps
-- General
vim.keymap.set('n', '<leader>w', ':w<CR>', {})
vim.keymap.set('n', '<leader>wq', ':w | bd<CR>', {})
vim.keymap.set("n", "<leader>ew", vim.cmd.Ex)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

-- Buffers
vim.keymap.set('n', '<tab>', ':bnext<CR>', {})
vim.keymap.set('n', '<S-tab>', ':bprev<CR>', {})
vim.keymap.set('n', '<leader>bd', ':bd<CR>', {})

-- Indent
vim.keymap.set('v', '<', '<gv', {})
vim.keymap.set('v', '>', '>gv', {})

vim.keymap.set('v', '<tab>', '>gv', {})
vim.keymap.set('v', '<s-tab>', '<gv', {})

-- Comment
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })
