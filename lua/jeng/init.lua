vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

require("jeng.lazy")
require("jeng.remap")
require("jeng.options")
require("jeng.cmds")

require("jeng.lualine")
require("jeng.netrw")

-- colors
vim.cmd.colorscheme('NeoSolarized')
vim.o.termguicolors = true
