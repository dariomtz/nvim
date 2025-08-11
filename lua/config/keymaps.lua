-- Keymaps
-- General
vim.keymap.set('n', '<leader>ww', ':w<CR>', {})
vim.keymap.set('n', '<leader>wq', ':w | bd<CR>', {})
vim.keymap.set("n", "<leader>ew", vim.cmd.Ex)

-- Go back
vim.keymap.set('n', '<leader>o', '<C-o>', {})

-- Telescope
function vim.getVisualSelection()
    vim.cmd('noau normal! "vz"')
    local text = vim.fn.getreg('v')
    vim.fn.setreg('v', {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ''
    end
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
vim.keymap.set('v', '<leader>s', function()
    local text = vim.getVisualSelection()
    if #text > 0 then
        builtin.grep_string({ search = text })
    else
        builtin.grep_string()
    end
end, {})
vim.keymap.set('n', '<leader>ws', function()
    -- Select the current word
    local text = vim.fn.expand("<cword>")
    text = vim.getVisualSelection()
    if #text > 0 then
        builtin.grep_string({ search = text })
    else
        builtin.grep_string()
    end
end, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})


-- Buffers
vim.keymap.set('n', '<tab>', ':bnext<CR>', {})
vim.keymap.set('n', '<S-tab>', ':bprev<CR>', {})
vim.keymap.set('n', '<leader>qq', ':bd<CR>', {})

-- Indent
vim.keymap.set('v', '<', '<gv', {})
vim.keymap.set('v', '>', '>gv', {})

vim.keymap.set('v', '<tab>', '>gv', {})
vim.keymap.set('v', '<s-tab>', '<gv', {})

-- Comment
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })

-- Github open
vim.api.nvim_set_keymap("n", "<leader>gh", ":OpenInGHFileLines<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>gh", ":OpenInGHFileLines<CR>", { noremap = true, silent = true })


