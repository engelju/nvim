require('lualine').setup{
    options = { 
        theme = 'solarized',
        section_separators = '', component_separators = '',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = { { 'filename', path = 3 } },
        lualine_x = {'diff', 'diagnostics', 'branch'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 2 } },
        lualine_x = {'location'},
        lualine_y = {'progress'},
        lualine_z = {}
    }
}

