-- with inspiration from breadonpenguins and theprimagen
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>n", vim.cmd.vnew)
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)

vim.keymap.set("n", "<leader>so", ":so %<CR>")
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>a", "ggVG") --select all
vim.keymap.set("v", "<leader>i", "=gv") --auto indent
vim.keymap.set("n", "<leader>w", ":w<CR>") --write file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>") --make a file executable
vim.keymap.set("n", "<leader>d", ":w ") --duplicate to new name
vim.keymap.set("n", "<leader>mv", ":!mv % ") --move a file to a new dir
vim.keymap.set("n", "<leader>gu", ':silent !xdg-open "<cWORD>" &<CR>') --open a url under cursor

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>b',  builtin.buffers, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fw', function()
	builtin.grep_string({
		default_text = vim.fn.expand("<cword>")
	});
end)
vim.keymap.set('n', '<leader>s', function()
	-- like fg but with search first
	builtin.grep_string({ search = vim.fn.input("Search for: ") });
end)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>',      builtin.git_files, {})

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- commentary
vim.keymap.set('n', '<leader>/', ':TComment<CR>', { silent = true })
vim.keymap.set('v', '<leader>/', ':TCommentMaybeInline<CR>', { silent = true })

-- == MISC

-- buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>:bnext<CR>') --ver split + open next buffer
vim.keymap.set('n', '<leader>hs', ':split<CR>:bnext<CR>') --hor split + open next buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")
vim.keymap.set("n", "<leader>bda", "::bufdo bd<CR>") --close all

-- misc
vim.keymap.set("n", "<leader>r", ":%s///g<Left><Left><Left>") --replace all in buffer
--vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- from primagen (check)
-- better defaults
vim.keymap.set("i", "<S-Tab>", "<C-d>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
vim.keymap.set("i", "<C-c>", "<Esc>")
