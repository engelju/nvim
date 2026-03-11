-- auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.g.start_time = vim.fn.reltime()
vim.loader.enable() --  SPEEEEEEEEEEED 

vim.call('plug#begin')

Plug('overcache/NeoSolarized')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim')
Plug('nvim-telescope/telescope.nvim')

Plug('nvim-treesitter/nvim-treesitter')

Plug('tpope/vim-fugitive')
Plug('tpope/vim-sensible')

Plug('tomtom/tcomment_vim')

-- Plug('nvim-tree/nvim-web-devicons') --pretty icons
-- Plug('mfussenegger/nvim-lint') --async linter
-- Plug('windwp/nvim-autopairs') --autopairs 
-- Plug('lewis6991/gitsigns.nvim') --git
-- Plug('numToStr/Comment.nvim') --easier comments
-- Plug('norcalli/nvim-colorizer.lua') --color highlight
--
-- Plug('ibhagwan/fzf-lua') --fuzzy finder and grep
-- Plug('numToStr/FTerm.nvim') --floating terminal
-- Plug('MeanderingProgrammer/render-markdown.nvim') --render md inline

vim.call('plug#end')
