local wk = require('which-key')

wk.add({
    { '<leader>t', group = 'Telescope' },
})

--- @param key string
--- @param cmd string|function
--- @param desc string
--- @param opts table?
local function map(key, cmd, desc, opts)
    local keymap = {
        '<leader>t' .. key,
        cmd,
        desc = desc,
    }

    if opts ~= nil then
        for k, v in pairs(opts) do
            keymap[k] = v
        end
    end

    wk.add(keymap)
end

--- @param key string
--- @param cmd string
--- @param desc string
--- @param opts table?
local function cmd_map(key, cmd, desc, opts)
    map(key, '<cmd>' .. cmd .. '<CR>', desc, opts)
end

--- @param key string
--- @param cmd string
--- @param desc string
--- @param opts table?
local function tel_map(key, cmd, desc, opts)
    cmd_map(key, 'Telescope ' .. cmd, desc, opts)
end

cmd_map('t', 'Telescope', 'All')

tel_map('f', 'find_files', 'Files')
tel_map('d', 'fd', 'Directories')
tel_map('t', 'live_grep', 'Text')
tel_map('b', 'buffers', 'Buffers')