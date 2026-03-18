-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require("lazy").setup({
	spec = {

		{ 'tpope/vim-sensible' },           -- sensible defaults
        -- == UI
		{ 'overcache/NeoSolarized' },       -- colorscheme
		{ 'f-person/auto-dark-mode.nvim' }, -- auto dark mode
        { 'nvim-lualine/lualine.nvim' },    -- status line

		{
			'nvim-telescope/telescope.nvim',
			dependencies = {
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope-fzf-native.nvim',
			}
		},
        -- == DEV
        -- === Treesitter
		{
			'nvim-treesitter/nvim-treesitter',
			lazy = false,
			build = ':TSUpdate'
		},
        -- === LSP
        {
            "mason-org/mason.nvim",
            opts = {},
        },
        {
            "mason-org/mason-lspconfig.nvim",
            dependencies = {
                "mason-org/mason.nvim",
                "neovim/nvim-lspconfig",
            },
            opts = {
                automatic_enable = true,
            },
        },
        {
            "ray-x/lsp_signature.nvim",
            opts = function()
              return {
                -- -- Window mode
                -- floating_window = true,                 -- Display it as floating window.
                -- hi_parameter = "IncSearch",             -- Color to highlight floating window.
                -- handler_opts = { border = 'rounded' },  -- Window style
                --
                -- -- Hint mode
                -- hint_enable = true, -- Display it as hint.
                -- hint_prefix = "👈 ",
                --
                -- -- Additionally, you can use <space>uH to toggle inlay hints.
                -- toggle_key_flip_floatwin_setting = true

                bind = true,
                handler_opts = {
                    border = "rounded"
                }
              }
            end,
            config = function(_, opts) require('lsp_signature').setup(opts) end
        },

        -- other misc dev
		{ 'tomtom/tcomment_vim' },          -- easier commenting out
        {
            'windwp/nvim-autopairs',
            dependencies = "windwp/nvim-ts-autotag",
            event = "InsertEnter",
            config = true
        },
        -- { 'bling/vim-bufferline' },
	    -- { 'mhinz/vim-sayonara' },
	},
})
