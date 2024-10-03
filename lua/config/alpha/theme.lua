local theme = require('alpha.themes.dashboard')

local default_header = {
    type = "text",
    val = {
        [[ ██▒   █▓ ▒█████   ██▓▓█████▄  ▒█████  ▒███████▒  ██████ ]],
        [[▓██░   █▒▒██▒  ██▒▓██▒▒██▀ ██▌▒██▒  ██▒▒ ▒ ▒ ▄▀░▒██    ▒ ]],
        [[ ▓██  █▒░▒██░  ██▒▒██▒░██   █▌▒██░  ██▒░ ▒ ▄▀▒░ ░ ▓██▄   ]],
        [[  ▒██ █░░▒██   ██░░██░░▓█▄   ▌▒██   ██░  ▄▀▒   ░  ▒   ██▒]],
        [[   ▒▀█░  ░ ████▓▒░░██░░▒████▓ ░ ████▓▒░▒███████▒▒██████▒▒]],
        [[   ░ ▐░  ░ ▒░▒░▒░ ░▓   ▒▒▓  ▒ ░ ▒░▒░▒░ ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░]],
        [[   ░ ░░    ░ ▒ ▒░  ▒ ░ ░ ▒  ▒   ░ ▒ ▒░ ░░▒ ▒ ░ ▒░ ░▒  ░ ░]],
        [[     ░░  ░ ░ ░ ▒   ▒ ░ ░ ░  ░ ░ ░ ░ ▒  ░ ░ ░ ░ ░░  ░  ░  ]],
        [[      ░      ░ ░   ░     ░        ░ ░    ░ ░          ░  ]],
        [[     ░                 ░               ░                 ]],
        [[      ▓█████ ▓█████▄  ██▓▄▄▄█████▓ ▒█████   ██▀███       ]],
        [[      ▓█   ▀ ▒██▀ ██▌▓██▒▓  ██▒ ▓▒▒██▒  ██▒▓██ ▒ ██▒     ]],
        [[      ▒███   ░██   █▌▒██▒▒ ▓██░ ▒░▒██░  ██▒▓██ ░▄█ ▒     ]],
        [[      ▒▓█  ▄ ░▓█▄   ▌░██░░ ▓██▓ ░ ▒██   ██░▒██▀▀█▄       ]],
        [[      ░▒████▒░▒████▓ ░██░  ▒██▒ ░ ░ ████▓▒░░██▓ ▒██▒     ]],
        [[      ░░ ▒░ ░ ▒▒▓  ▒ ░▓    ▒ ░░   ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░     ]],
        [[       ░ ░  ░ ░ ▒  ▒  ▒ ░    ░      ░ ▒ ▒░   ░▒ ░ ▒░     ]],
        [[         ░    ░ ░  ░  ▒ ░  ░      ░ ░ ░ ▒    ░░   ░      ]],
        [[         ░  ░   ░     ░               ░ ░     ░          ]],
        [[              ░                                          ]],
    },
    opts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow";
    },
}

local footer = {
    type = "text",
    val = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
    end,
    opts = {
        position = "center",
        hl = "Number",
    },
}

--- @class Button
--- @field icon string
--- @field desc string
--- @field shortcut string
--- @field action string
---
--- @param btns Button[]
--- @return table[]
local function make_buttons(btns)
    --- @type table[]
    local result = {}

    for i,v in ipairs(btns) do
        local sc = v.shortcut:gsub('%s', '')

        local function on_press()
            local key = vim.api.nvim_replace_termcodes(v.action .. "<Ignore>", true, false, true)
            vim.api.nvim_feedkeys(key, "t", false)
        end

        result[i] = {
            type = 'button',
            val = v.icon .. '  ' .. v.desc,
            on_press = on_press,
            opts = {
                position = "center",
                shortcut = v.shortcut,
                cursor = 3,
                width = 50,
                align_shortcut = "right",
                hl_shortcut = "Keyword",
                keymap = { 'n', sc, v.action, { noremap = true, silent = true, nowait = true } },
            },
        }
    end

    return result
end

local buttons = {
    type = "group",
    val = make_buttons({
        { action = '<cmd>Telescope find_files<CR>', desc = 'Find File', icon = '', shortcut = 'f' },
        { action = '<cmd>ene | startinsert<CR>',    desc = 'New File',  icon = '', shortcut = 'n' },
        { action = '<cmd>SessionSearch<CR>', desc = 'Find Session', icon = '', shortcut = 's' },
        { action = '<cmd>Telescope live_grep<CR>', desc = 'Find Text', icon = '', shortcut = 'g' },
        -- TODO Config
        { action = '<cmd>SessionRestore<CR>', desc = 'Restore Session', icon = '', shortcut = 'r' },
        { action = '<cmd>LazyExtras<CR>', desc = 'Lazy Extras', icon = '', shortcut = 'x' },
        { action = '<cmd>Lazy<CR>', desc = 'Lazy', icon = '󰒲', shortcut = 'l' },
        { action = '<cmd>qa<CR>', desc = 'Quit', icon = '', shortcut = 'q' }
    }),
    opts = {
        spacing = 1,
    },
}

local section = {
    terminal = theme.section.terminal,
    header = default_header,
    buttons = buttons,
    footer = footer,
}

local config = {
    layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        section.footer,
    },
    opts = {
        margin = 5,
    },
}

return {
    section = section,
    config = config,
}