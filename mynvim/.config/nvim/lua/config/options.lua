vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.confirm = true -- Confirm to save changes before exiting modified buffer

opt.mouse = "a" -- Enable mouse mode
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.spelllang = { "en" }

-- Ui
opt.cursorline = true -- Enable highlighting of the current line
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.completeopt = "menu,menuone,noselect"
opt.termguicolors = true -- True color support
-- opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.wrap = false -- Disable line wrap
opt.list = true -- Show some invisible characters (tabs...

-- Number and side column
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

-- Splitting
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

-- Search and replace
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals

-- Tabs
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for

-- Scrolling
opt.scrolloff = 4 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.smoothscroll = true

-- undo file
opt.undofile = true
opt.undolevels = 10000

-- Folding
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99 -- Open all unfolded
