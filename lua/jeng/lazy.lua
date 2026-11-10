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

		{ "tpope/vim-sensible" }, -- sensible defaults
		-- == UI
		{ "overcache/NeoSolarized" }, -- colorscheme
		{ "f-person/auto-dark-mode.nvim" }, -- auto dark mode
		{ "nvim-lualine/lualine.nvim" }, -- status line

		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-fzf-native.nvim",
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
			opts = {},
		},
		-- == DEV
		{ "airblade/vim-gitgutter" },
		-- === Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			branch = "main",
			lazy = false,
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter").install({
					"go",
					"gomod",
					"gosum",
					"lua",
					"python",
					"yaml",
					"json",
					"markdown",
					"markdown_inline",
					"bash",
					"dockerfile",
					"hcl",
					"toml",
					"vim",
					"vimdoc",
					"regex",
				})
				local function start(buf)
					if pcall(vim.treesitter.start, buf) then
						vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end
				local available
				vim.api.nvim_create_autocmd("FileType", {
					callback = function(args)
						local ts = require("nvim-treesitter")
						local lang = vim.treesitter.language.get_lang(args.match) or args.match
						if not available then
							available = {}
							for _, l in ipairs(ts.get_available()) do
								available[l] = true
							end
						end
						-- auto_install: missing but available parsers get installed, then started
						if available[lang] and not vim.list_contains(ts.get_installed("parsers"), lang) then
							ts.install(lang):await(vim.schedule_wrap(function()
								if vim.api.nvim_buf_is_valid(args.buf) then
									start(args.buf)
								end
							end))
						else
							start(args.buf)
						end
					end,
				})
			end,
		},
		-- === LSP
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			dependencies = { "williamboman/mason.nvim" },
			opts = {
				ensure_installed = {
					-- lsps
					"gopls",
					"yaml-language-server",
					"json-lsp",
					"lua_ls",
					"pyright",
					"marksman",
					"jdtls",
					-- formatters
					"gofumpt",
					"goimports",
					"stylua",
					"ruff",
					"prettier",
				},
				auto_update = true,
				run_on_start = true,
			},
		},
		{
			"stevearc/conform.nvim",
			event = "BufWritePre",
			opts = {
				formatters_installed_by_mason = true,
				format_on_save = {
					timeout_ms = 1000,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					go = { "gofumpt", "goimports" },
					lua = { "stylua" },
					python = { "ruff_format" },
					yaml = { "prettier" },
					json = { "prettier" },
					jsonc = { "prettier" },
					markdown = { "prettier" },
				},
			},
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
			event = "InsertEnter",
			opts = {
				bind = true,
				handler_opts = {
					border = "rounded",
				},
			},
		},
		-- other misc dev
		{ "tomtom/tcomment_vim" }, -- easier commenting out
		{
			"windwp/nvim-autopairs",
			dependencies = "windwp/nvim-ts-autotag",
			event = "InsertEnter",
			config = true,
		},
		-- { 'bling/vim-bufferline' },
		-- { 'mhinz/vim-sayonara' },
	},
})
