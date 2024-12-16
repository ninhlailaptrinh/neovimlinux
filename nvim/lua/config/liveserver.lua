vim.api.nvim_create_autocmd("FileType", {
    pattern = {"html", "css", "javascript"},
    callback = function()
        -- Bắt đầu live server
        vim.keymap.set('n', '<leader>ll', function()
            vim.cmd('w')  -- Lưu file trước
            vim.cmd('FloatermNew --name=liveserver live-server --port=3000')
        end, {
            noremap = true,
            buffer = true,
            desc = "Start Live Server"
        })
        
        -- Tắt live server
        vim.keymap.set('n', '<leader>ls', function()
            vim.cmd('FloatermKill liveserver')
        end, {
            noremap = true,
            buffer = true,
            desc = "Stop Live Server"
        })

        -- Toggle terminal live server
        vim.keymap.set('n', '<leader>lt', function()
            vim.cmd('FloatermToggle liveserver')
        end, {
            noremap = true,
            buffer = true,
            desc = "Toggle Live Server terminal"
        })
    end
}) 