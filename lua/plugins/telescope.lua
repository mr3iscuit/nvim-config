local ts = require 'telescope'
local actions = require("telescope.actions")

-- Setup.
ts.setup({
    defaults = {
        sort_mru = true,
        sorting_strategy = 'ascending',
        border = true,
        multi_icon = '',
        entry_prefix = '   ',
        prompt_prefix = '   ',
        selection_caret = '  ',
        hl_result_eol = true,
        results_title = "",
        winblend = 0,
        wrap_results = true,
        file_ignore_patterns = {
            "build/", "node_modules/", ".git/",
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                -- ['<C-p>'] = require('telescope.actions.layout').toggle_preview
            },
        },
        layout_config = {
            prompt_position = 'top',
            horizontal = {
                preview_cutoff = 100,
                preview_width = 0.5,
            },
            vertical = {
                preview_cutoff = 0.4,
            },
            flex = {
                flip_columns = 110,
            },
            height = 0.94,
            width = 0.86,
        },
        -- preview = {
        --     hide_on_startup = true -- hide previewer when picker starts
        -- },
        -- pickers = {
        --     colorscheme = {
        --         enable_preview = true
        --     }
        -- },
        -- layout_config = {
        --     horizontal = { width = 0.6 },
        --     prompt_position = 'top',
        -- },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}

        }
    }
})

pcall(require('telescope').load_extension, 'fzf')
require("telescope").load_extension("ui-select")
