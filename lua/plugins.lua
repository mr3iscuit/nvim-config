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
    {
        "karb94/neoscroll.nvim",
        config = function()
            require "plugins/neoscroll-conf"
        end
    },

    -- A small Neovim plugin for previewing native LSP's goto definition, type definition, implementation, and references calls in floating windows.
    {
        'rmagatti/goto-preview',
        config = function()
            require("plugins/goto-preview")
        end
    },

    { "nvim-lua/plenary.nvim", },


    -- Vim regex pattern syntax highlighting.
    { "galicarnax/vim-regex-syntax", },

    -- fzf
    { "junegunn/fzf", },

    -- formatter
    {
        'mhartington/formatter.nvim',
        config = function()
            require "plugins/format-nvim"
        end
    },

    -- theming
    {
        'projekt0n/github-nvim-theme',
        dependencies = {
            "xiyaowong/transparent.nvim",
        },
        config = function()
            vim.cmd [[colorscheme github_dark_dimmed]]
            require("transparent").setup({
                groups = { -- table: default groups
                    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
                },
                extra_groups = {},   -- table: additional groups that should be cleared
                exclude_groups = {}, -- table: groups you don't want to clear
            })
        end
    },

    -- essentials
    {
        "echasnovski/mini.trailspace",
        event = "BufEnter",
        config = function() require("mini.trailspace").setup {} end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },
    {
        "kyazdani42/nvim-web-devicons",
    },
    {
        "folke/zen-mode.nvim",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "plugins/indent-blankline"
        end,
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
        event = "BufEnter",
        config = function()
            require "plugins/treesitter"
        end,
        build = ":TSUpdate",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "BufEnter",
    },
    {
        "nkrkv/nvim-treesitter-rescript",
    },
    -- treesitter\

    -- Align
    {
        'Vonr/align.nvim',
    },

    -- lsp
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'mfussenegger/nvim-jdtls',
            {
                'j-hui/fidget.nvim',
                opts = {}
            },
        },
        config = function()
            require "plugins/lsp"
        end,
    },
    {
        "glepnir/lspsaga.nvim",
        event = "BufEnter",
        config = function()
            require "plugins/lspsaga"
        end,
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
        config = function()
            require "plugins/cmp"
        end,
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
        ependencies = {
            "nvim-lua/plenary.nvim"
        },
    },
    -- flutter\

    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "kyazdani42/nvim-web-devicons"
        },
        config = function()
            -- require("plugins/tree")
            require('nvim-tree').setup({
                git = {
                    enable = true,
                    ignore = false,
                    timeout = 500,
                },
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
        event = "VimEnter",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function() require "plugins/lualine" end,
    },

    -- terminal
    {
        "akinsho/toggleterm.nvim",
        config = function() require "plugins/toggleterm" end,
    },

    -- git
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        config = function() require "plugins/gitsigns" end,
    },

    -- comments
    {
        "numToStr/Comment.nvim",
        event = "BufEnter",
        config = function() require "plugins/comment" end,
    },

    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "mzlogin/vim-markdown-toc",
    },

    -- misc
    {
        "folke/which-key.nvim",
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
    },
    lockfile = "~/.config/nvim/lazy-lock.json", -- FIXME: It would be great to have it under nix
}

lazy.setup(plugins, options)
