-- system
vim.opt.title = true -- automatic window titlebar
vim.opt.mouse = "a" -- enable mouse
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.autochdir = true -- auto change into directory
vim.opt.termguicolors = true -- modern colors
vim.g.loaded_python3_provider = 0 -- skip slow python3/pynvim probe on python files

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- vim.opt.tabstop = 4 --visual width of tab

-- history & backup
vim.opt.history = 100 -- command line history
-- vim.opt.swapfile = false --swap just gets in the way usually
-- vim.opt.backup = false
-- vim.opt.undofile = true --undos are saved to file
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- performance
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.smoothscroll = true

-- status line
vim.opt.signcolumn = "yes" -- space for diagnostics
vim.opt.laststatus = 3 -- global statusline, for lualine
vim.opt.showmode = false -- unnecessairy due to lualine
vim.opt.showcmd = true -- show partial command in normal mode

-- search
vim.opt.hlsearch = true -- highlight matches
vim.opt.incsearch = true -- live search feedback
vim.opt.ignorecase = true -- ignore case while searching
vim.opt.smartcase = true -- but do not ignore if caps are used

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99 -- disable folding lower #s enable
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- ui
-- vim.opt.number = true
-- vim.opt.numberwidth = 4
vim.opt.splitkeep = "screen" -- stablizie window open/close
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true -- highlight current line
-- vim.opt.conceallevel = 2 --markdown conceal
vim.opt.concealcursor = "nc"
