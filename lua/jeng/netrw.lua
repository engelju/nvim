vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    local opts = { buffer = true, remap = true }
    vim.keymap.set("n", "c", "%", opts)      -- create
    vim.keymap.set("n", "r", "R", opts)      -- rename
    vim.keymap.set("n", "d", "D", opts)      -- delete
    vim.keymap.set("n", "h", "-", opts)      -- dir up
    vim.keymap.set("n", "l", "<CR>", opts)   -- dir down
    vim.keymap.set("n", ".", "gh", opts)     -- toggle hidden
  end,
})

-- open netrw when no buffer
vim.api.nvim_create_augroup("explorer_on_empty", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = "explorer_on_empty",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    local is_empty = name == "" and #lines <= 1 and (lines[1] or "") == ""

    if is_empty and vim.bo.buftype == "" then
      vim.cmd("Ex")
    end
  end,
})

-- display full path in netrw
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.opt_local.statusline = "%{b:netrw_curdir}"
  end,
})
