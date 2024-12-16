require('colorizer').setup({
    -- Tất cả các file types sẽ được highlight
    '*';
    -- Cấu hình riêng cho từng file type
    css = { 
        rgb_fn = true,      -- Hỗ trợ rgb()
        hsl_fn = true,      -- Hỗ trợ hsl()
        css = true,         -- Hỗ trợ tên màu CSS
        css_fn = true,      -- Hỗ trợ các hàm CSS
    },
    html = { names = true },
    javascript = { names = true },
    scss = { css = true },
    sass = { css = true },
    less = { css = true },
}) 