return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    config = function()
        require('alpha').setup(require('theme').config)

        -- open dashboard after closing lazy
        if vim.o.filetype == "lazy" then
            vim.api.nvim_create_autocmd("WinClosed", {
            pattern = tostring(vim.api.nvim_get_current_win()),
            once = true,
            callback = function()
                vim.schedule(function()
                vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
                end)
            end,
            })
        end
    end,
}