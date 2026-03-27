-- auto-create missing dirs when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- spellcheck in md
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal spell wrap",
})

-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- reload files on external change
vim.api.nvim_create_autocmd("FocusGained", {
	pattern = "*",
	command = "checktime",
})

-- restore cursor pos on file open
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if line > 1 and line <= vim.fn.line("$") then
			vim.cmd("normal! g'\"")
		end
	end,
})

-- set vim.g.startuptime
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local startuptime = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
		vim.g.startup_time_ms = string.format("%.2f ms", startuptime * 1000)
	end,
})

-- enable LSP
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		require("lsp_signature").on_attach({
			bind = true,
			floating_window = true,
			hint_enable = false,
			handler_opts = { border = "rounded" },
		}, ev.buf)
	end,
})
