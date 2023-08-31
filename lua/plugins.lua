local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require "lazy"

local plugins = {
    -- A small Neovim plugin for previewing native LSP's goto definition, type definition, implementation, and references calls in floating windows.
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {
                width = 81,                                          -- Width of the floating window
                height = 20,                                         -- Height of the floating window
                border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
                default_mappings = false,                            -- Bind default mappings
                debug = false,                                       -- Print debug information
                opacity = nil,                                       -- 0-100 opacity level of the floating window where 100 is fully transparent.
                resizing_mappings = false,                           -- Binds arrow keys to resizing the floating window.
                post_open_hook = nil,                                -- A function taking two arguments, a buffer and a window to be ran as a hook.
                post_close_hook = nil,                               -- A function taking two arguments, a buffer and a window to be ran as a hook.
                references = {                                       -- Configure the telescope UI for slowing the references cycling window.
                    telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
                },
                -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
                focus_on_open = true,                                        -- Focus the floating window when opening it.
                dismiss_on_move = false,                                     -- Dismiss the floating window when moving the cursor.
                force_close = true,                                          -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
                bufhidden = "wipe",                                          -- the bufhidden option to set on the floating window. See :h bufhidden
                stack_floating_preview_windows = true,                       -- Whether to nest floating windows
                preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename

            }
        end
    },

    { "nvim-lua/plenary.nvim", },

    -- Vim regex pattern syntax highlighting.
    { "galicarnax/vim-regex-syntax", },

    -- fzf
    { "junegunn/fzf",                version = "*", },

    -- formatter
    { 'mhartington/formatter.nvim',  version = "*", config = function() require "plugins/format-nvim" end },

    -- theming
    { 'projekt0n/github-nvim-theme' }, { "catppuccin/nvim", as = "catppuccin" },

    -- essentials
    {
        "echasnovski/mini.trailspace",
        version = "*",
        event = "BufEnter",
        config = function() require("mini.trailspace").setup {} end,
    },
    { "windwp/nvim-autopairs",               version = "*", config = function() require("nvim-autopairs").setup {} end },
    { "kyazdani42/nvim-web-devicons",        version = "*", },
    { "folke/zen-mode.nvim",                 version = "*", },
    { "lukas-reineke/indent-blankline.nvim", version = "*", config = function() require "plugins/indent-blankline" end, },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
        event = "BufEnter",
        config = function() require "plugins/treesitter" end,
        build = ":TSUpdate",
    },
    { "nvim-treesitter/nvim-treesitter-textobjects", version = "*", event = "BufEnter", },
    { "nkrkv/nvim-treesitter-rescript",              version = "*", },
    -- treesitter\

    -- Align
    { 'Vonr/align.nvim',                             version = "*", },

    -- lsp
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'mfussenegger/nvim-jdtls',
            { 'j-hui/fidget.nvim', opts = {} },
        },
        config = function()
            require "plugins/lsp"
        end,
    },
    {
        "glepnir/lspsaga.nvim",
        event = "BufEnter",
        config = function() require "plugins/lspsaga" end,
    },
    -- lsp\


    -- java
    { 'mfussenegger/nvim-jdtls', },

    -- autocompletions
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        },
        config = function() require "plugins/cmp" end,
    },

    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'jay-babu/mason-nvim-dap.nvim',
            'rcarriga/nvim-dap-ui',
            'williamboman/mason.nvim',
            'leoluz/nvim-dap-go',
        },
        config = function()
            require("plugins/dap")
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
    --outocompletions\

    -- flutter
    {
        "akinsho/flutter-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- flutter\

    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            -- require("plugins/tree")
            require('nvim-tree').setup({
                git = {
                    enable = true,
                    ignore = false,
                    timeout = 500,
                },
                -- update_cwd = true,
                -- open_on_setup = true,
                -- open_on_setup_file = true,
                -- actions = {
                --     open_file = {
                --         resize_window = true,
                --     },
                -- },
                -- view = {
                --     side = "left",
                -- },
                -- update_focused_file = {
                --     enable = true,
                --     update_cwd = true,
                -- },
                -- filters = {
                --     dotfiles = false,
                -- },
                -- diagnostics = {
                --     enable = true,
                -- },
            })
        end,
    },
    -- file tree\

    -- fuzzy finders
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "telescope-fzf-native.nvim",
        },
        config = function() require "plugins/telescope" end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
    },
    {
        "ThePrimeagen/harpoon",
    },
    -- fuzzy finders\

    -- bars
    {
        "nvim-lualine/lualine.nvim",
        version = "*",
        event = "VimEnter",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function() require "plugins/lualine" end,
    },

    -- terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function() require "plugins/toggleterm" end,
    },

    -- git
    {
        "lewis6991/gitsigns.nvim",
        version = "*",
        event = "BufEnter",
        config = function() require "plugins/gitsigns" end,
    },

    -- comments
    {
        "numToStr/Comment.nvim",
        version = "*",
        event = "BufEnter",
        config = function() require "plugins/comment" end,
    },

    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        version = "*",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "mzlogin/vim-markdown-toc",
        version = "*",
    },

    -- misc
    {
        "folke/which-key.nvim",
        version = "*",
        config = function() require "plugins/which-key" end,
    },
    {
        "jiaoshijie/undotree",
        config = function() require "plugins/undotree" end,
    }
}

local options = {
    defaults = {
        lazy = false,
        version = "*",
    },
    lockfile = "~/.config/nvim/lazy-lock.json", -- FIXME: It would be great to have it under nix
}

lazy.setup(plugins, options)
