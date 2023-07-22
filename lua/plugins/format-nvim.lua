-- Utilities for creating configurations
local util = require "formatter.util"

local patch_clangformat_bug = function(f)
    local o = f()
    if o.args and type(o.args) == 'table' then
        local new_args = {}
        local skip = false
        for i, v in ipairs(o.args) do
            if skip then
                skip = false
            elseif v == '-assume-filename'
                and (o.args[i + 1] == "''" or o.args[i + 1] == '""')
            then
                skip = true
            elseif type(v) ~= 'string' or not v:find('^-style=') then
                table.insert(new_args, v)
            end
        end
        o.args = new_args
    end
    return o
end

require("formatter").setup({
    filetype = {
        cpp = { patch_clangformat_bug(require('formatter.filetypes.cpp').clangformat) }
    }
})

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,

            -- You can also define your own configuration
            function()
                -- Supports conditional formatting
                if util.get_current_buffer_file_name() == "special.lua" then
                    return nil
                end

                -- Full specification of configurations is down below and in Vim help
                -- files
                return {
                    exe = "stylua",
                    args = {
                        "--search-parent-directories",
                        "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                        "--",
                        "-",
                    },
                    stdin = true,
                }
            end
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        -- cpp = {
        --     -- "formatter.filetypes.any" defines default configurations for any
        --     -- filetype
        --     require("formatter.filetypes.cpp").stylua
        -- }
        cpp = { patch_clangformat_bug(require('formatter.filetypes.cpp').clangformat) }
    }
}

-- require("formatter").setup({
--   filetype = {
--     cpp = { patch_clangformat_bug(require('formatter.filetypes.cpp').clangformat) }
--   }
-- })
