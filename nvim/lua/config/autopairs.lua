require('nvim-autopairs').setup({
    check_ts = true,                -- Tích hợp với treesitter
    disable_filetype = { "TelescopePrompt" }, -- Disable trong telescope prompt
    fast_wrap = {                   -- Cấu hình fast wrap
        map = '<M-e>',              -- Phím tắt để wrap text (Alt-e)
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
}) 