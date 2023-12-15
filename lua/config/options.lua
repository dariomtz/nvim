local opt = vim.opt

-- Tab / Inentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Appearence
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = {80,120}
opt.signcolumn = "yes"
opt.scrolloff = 100
opt.completeopt = "menuone,noinsert,noselect"

-- Behavior
opt.hidden = true
opt.errorbells = false
opt.swapfile = true 
opt.backup = false 
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append('a')
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"

