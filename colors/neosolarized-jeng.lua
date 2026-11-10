-- NeoSolarized with small tweaks
vim.cmd.runtime("colors/NeoSolarized.vim")
vim.g.colors_name = "neosolarized-jeng"

local function blend(fg, bg, a)
	local c = 0
	for shift = 16, 0, -8 do
		local f, b = bit.band(bit.rshift(fg, shift), 0xff), bit.band(bit.rshift(bg, shift), 0xff)
		c = bit.bor(c, bit.lshift(math.floor(f * a + b * (1 - a) + 0.5), shift))
	end
	return c
end

-- inline code (`xxx`) in markdown: Normal fg, slightly dimmed instead of red Special
local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
if normal.fg and normal.bg then
	vim.api.nvim_set_hl(0, "@markup.raw", { fg = blend(normal.fg, normal.bg, 0.75) })
end

-- links in markdown: keep Underlined color, but no underline
local link = vim.api.nvim_get_hl(0, { name = "Underlined", link = false })
link.underline = nil
for _, group in ipairs({ "@markup.link", "@markup.link.label", "@markup.link.url" }) do
	vim.api.nvim_set_hl(0, group, link)
end
