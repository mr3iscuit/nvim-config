-- Set space as leader
vim.g.mapleader = ","

-- local map = vim.keymap.set
local opts = { silent = true }

vim.keymap.set("x", "<leader>w", "<C-w>")

-- dap
-- Basic debugging keymaps, feel free to change to your liking!
local dap = require 'dap'
local dapui = require 'dapui'

vim.keymap.set(
    'n',
    '<F1>',
    dap.step_into
)

vim.keymap.set(
    'n',
    '<F2>',
    dap.step_over
)

vim.keymap.set(
    'n',
    '<F3>',
    dap.step_out
)

vim.keymap.set(
    'n',
    '<F5>',
    dap.continue
)

vim.keymap.set(
    'n',
    '<leader>b',
    dap.toggle_breakpoint
)

vim.keymap.set(
    'n',
    '<leader>B',
    function()
        dap.set_breakpoint(
            vim.fn.input 'Breakpoint condition: '
        )
    end
)

vim.keymap.set(
    'n',
    '<leader>w',
    "<cmd>:lua require('dapui').toggle() <CR>",
    { desc = 'Toggle dap ui' }
)

-- F7 and F8 for tab
vim.keymap.set(
    'n',
    '<F7>',
    ':tabp<CR>',
    { noremap = true }
)

vim.keymap.set(
    'n',
    '<F8>',
    ':tabn<CR>',
    { noremap = true }
)

-- -- pipe in azerbaijani layout
-- map('n', '<leder>\\', 'i|<esc>', { noremap = true })
--
-- -- double brace
-- -- normal mode
-- map('n', 'çço', 'a[[<esc>', { noremap = true })
-- map('n', 'ççc', 'a]]<esc>', { noremap = true })
-- map('n', 'ççü', 'a[[|]]<esc>hh', { noremap = true })
-- map('n', 'ççp', 'a|<esc>', { noremap = true })
--
-- -- insert mode
-- map('i', 'çço', '[[', { noremap = true })
-- map('i', 'ççc', ']]', { noremap = true })
-- map('i', 'ççü', '<esc>i [[|<esc>i', { noremap = true })
-- map('i', 'ççp', '|', { noremap = true })
--

-- Mapping for visual mode to copy the selected text to the clipboard
vim.keymap.set(
    'v',
    ',cp',
    ':w !wl-copy<CR><Esc>',
    { noremap = true }
)

-- Map
vim.keymap.set(
    "n",
    "<Leader>w",
    "<C-w>"
)

-- Better up/down
vim.keymap.set(
    "n",
    "j",
    "v:count == 0 ? 'gj' : 'j'",
    {
        expr = true,
        silent = true
    }
)

vim.keymap.set(
    "n",
    "k",
    "v:count == 0 ? 'gk' : 'k'",
    {
        expr = true,
        silent = true
    }
)

-- Move lines
vim.keymap.set(
    "v",
    "J",
    ":m '>+1<CR>gv=gv"
)

vim.keymap.set(
    "v",
    "K",
    ":m '<-2<CR>gv=gv"
)

-- Resizing panes
vim.keymap.set(
    'n',
    '<C-h>',
    ':vertical resize -5<CR>',
    { noremap = true }
)

vim.keymap.set(
    'n',
    '<C-j>',
    ':resize -1<CR>',
    { noremap = true }
)

vim.keymap.set(
    'n',
    '<C-k>',
    ':resize +1<CR>',
    { noremap = true }
)

vim.keymap.set(
    'n',
    '<C-l>',
    ':vertical resize +5<CR>',
    { noremap = true }
)


-- focus between splits Ctrl+{hjkl}
-- map('n', '<C-h>', ':wincmd h<CR>', { noremap = true })
-- map('n', '<C-j>', ':wincmd j<CR>', { noremap = true })
-- map('n', '<C-k>', ':wincmd k<CR>', { noremap = true })
-- map('n', '<C-l>', ':wincmd l<CR>', { noremap = true })


-- Join lines without moving the curser to the end
vim.keymap.set(
    "n",
    "J",
    "mzJ`z"
)

-- Better indenting
vim.keymap.set(
    "v",
    "<",
    "<gv"
)

vim.keymap.set(
    "v",
    ">",
    ">gv"
)

-- Clear search with <esc>
vim.keymap.set(
    { "i", "n" },
    "<esc>",
    "<cmd>noh<cr><esc>",
    { desc = "Escape and clear hlsearch" }
)

-- Half page jumping and curser stays in the middle
vim.keymap.set(
    "n",
    "<C-d>",
    "<C-d>zz"
)

vim.keymap.set(
    "n",
    "<C-u>",
    "<C-u>zz"
)

-- Center after search and jumps
-- vim.keymap.set(
--     "n",
-- 	"n",
-- 	"nzzzv"
-- )
--
-- vim.keymap.set(
--     "n",
-- 	"N",
-- 	"Nzzzv"
-- )

-- Paste and without overwriting register
vim.keymap.set(
    "x",
    "<leader>p",
    [["_dP]]
)

-- Delete and without overwriting register
-- map({ "n", "v" }, "<leader>d", [["_d]])

-- Easier window switching with leader + Number
for i = 1, 6 do
    local lhs = "<Leader>" .. i
    local rhs = i .. "<C-W>w"

    vim.keymap.set(
        "n",
        lhs,
        rhs,
        { desc = "Move to Window " .. i }
    )
end

-- Terminal
vim.keymap.set(
    { "n", "t" },
    "<leader>t",
    "<Cmd>ToggleTerm<CR>"
)

-- Tabs
vim.keymap.set(
    "n",
    "<leader><tab>l",
    "<cmd>tablast<cr>",
    { desc = "Last Tab" }
)

vim.keymap.set(
    "n",
    "<leader><tab>f",
    "<cmd>tabfirst<cr>",
    { desc = "First Tab" }
)

vim.keymap.set(
    "n",
    "<leader><tab><tab>",
    "<cmd>tabnew<cr>",
    { desc = "New Tab" }
)

vim.keymap.set(
    "n",
    "<leader><tab>]",
    "<cmd>tabnext<cr>",
    { desc = "Next Tab" }
)

vim.keymap.set(
    "n",
    "<leader><tab>[",
    "<cmd>tabprevious<cr>",
    { desc = "Previous Tab" }
)

vim.keymap.set(
    "n",
    "<leader><tab>q",
    "<cmd>tabclose<cr>",
    { desc = "Close Tab" }
)

vim.keymap.set('n',
    '<leader>e',
    '<cmd>NvimTreeToggle<cr>',
    opts
)

vim.keymap.set('n',
    '<esc>',
    '<cmd>NvimTreeClose<cr>',
    opts
)

-- Telescope
vim.keymap.set(
    'n',
    '<leader>sf',
    require('telescope.builtin').find_files,
    { desc = '[S]earch [F]iles' }
)

vim.keymap.set(
    'n',
    '<leader>sh',
    require('telescope.builtin').help_tags,
    { desc = '[S]earch [H]elp' }
)

vim.keymap.set(
    'n',
    '<leader>sw',
    require('telescope.builtin').grep_string,
    { desc = '[S]earch current [W]ord' }
)

vim.keymap.set(
    'n',
    '<leader>sg',
    require('telescope.builtin').live_grep,
    { desc = '[S]earch by [G]rep' }
)

vim.keymap.set(
    'n',
    '<leader>sd',
    require('telescope.builtin').diagnostics,
    { desc = '[S]earch [D]iagnostics' }
)

vim.keymap.set(
    'n',
    '<leader>sb',
    require('telescope.builtin').buffers,
    { desc = '[S]earch [B]uffers' }
)

-- -- Harpoon
-- map("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
-- map("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
-- map("n", "<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true })
-- map("n", "<C-j>", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true })
-- map("n", "<C-k>", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true })
-- map("n", "<C-l>", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true })

-- Undotree
vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    { desc = "Go to previous diagnostic message" }
)

vim.keymap.set(
    'n',
    ']d',
    vim.diagnostic.goto_next,
    { desc = "Go to next diagnostic message" }
)

vim.keymap.set(
    'n',
    '<leader>q',
    vim.diagnostic.setloclist,
    { desc = "Open diagnostics list" }
)

vim.keymap.set(
    'n',
    '<leader>d',
    vim.diagnostic.open_float,
    { desc = "Open floating diagnostics message" }
)

vim.keymap.set(
    'n',
    '<C-i>',
    vim.diagnostic.open_float,
    { desc = "Open floating diagnostic message" }
)

-- ALIGN
--
-- align_to_char(length, reverse, preview, marks)
-- align_to_string(is_pattern, reverse, preview, marks)
-- align(str, reverse, marks)
-- operator(fn, opts)
-- Where:
--      length: integer
--      reverse: boolean
--      preview: boolean
--      marks: table (e.g. {1, 0, 23, 15})
--      str: string (can be plaintext or Lua pattern if is_pattern is true)

local noremapAndSilent = {
    noremap = true,
    silent = true
}

-- Aligns to 1 character, looking left
vim.keymap.set(
    'x',
    'aa',
    function()
        require 'align'.align_to_char(1, true)
    end,
    noremapAndSilent
)

-- Aligns to 2 characters, looking left and with previews
vim.keymap.set(
    'x',
    'as',
    function()
        require 'align'.align_to_char(2, true, true)
    end,
    noremapAndSilent
)

-- Aligns to a string, looking left and with previews
vim.keymap.set(
    'x',
    'aw',
    function()
        require 'align'.align_to_string(false, true, true)
    end,
    noremapAndSilent
)

-- Aligns to a Lua pattern, looking left and with previews
vim.keymap.set(
    'x',
    'ar',
    function()
        require 'align'.align_to_string(true, true, true)
    end,
    noremapAndSilent
)

-- Example gawip to align a paragraph to a string, looking left and with previews
vim.keymap.set(
    'n',
    'gaw',
    function()
        local a = require 'align'
        a.operator(
            a.align_to_string,
            { is_pattern = false, reverse = true, preview = true }
        )
    end,
    noremapAndSilent
)

-- Example gaaip to aling a paragraph to 1 character, looking left
vim.keymap.set(
    'n',
    'gaa',
    function()
        local a = require 'align'
        a.operator(
            a.align_to_char,
            { length = 1, reverse = true }
        )
    end,
    noremapAndSilent
)

-- LSP
-- go to "lsp/lsp.lua"
-- map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
-- map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

-- Import the goto-preview module
local goto_preview = require('goto-preview')

-- Define Lua mappings
vim.keymap.set(
    'n',
    'gpd',
    goto_preview.goto_preview_definition,
    { noremap = true, silent = true }
)

vim.keymap.set(
    'n',
    'gpt',
    goto_preview.goto_preview_type_definition,
    { noremap = true, silent = true }
)

vim.keymap.set(
    'n',
    'gpi',
    goto_preview.goto_preview_implementation,
    { noremap = true, silent = true }
)

vim.keymap.set(
    'n',
    'gP',
    goto_preview.close_all_win,
    { noremap = true, silent = true }
)

vim.keymap.set(
    'n',
    'gpr',
    goto_preview.goto_preview_references,
    { noremap = true, silent = true }
)

--java JDTLS
-- Organize imports

local jdtls = require("jdtls")

vim.keymap.set(
    'n',
    '<A-o>',
    ':lua require("jdtls").organize_imports()<CR>',
    { noremap = true, silent = true }
)

-- Extract variable
vim.keymap.set(
    'n',
    'crv',
    ':lua require("jdtls").extract_variable()<CR>',
    { noremap = true, silent = true }
)

vim.keymap.set(
    'x',
    'crv',
    '<Esc>:lua require("jdtls").extract_variable(true)<CR>',
    { noremap = true, silent = true }
)

-- Extract constant
vim.keymap.set(
    'n',
    'crc',
    ':lua require("jdtls").extract_constant()<CR>',
    { noremap = true, silent = true }
)

vim.keymap.set(
    'x',
    'crc',
    '<Esc>:lua require("jdtls").extract_constant(true)<CR>',
    { noremap = true, silent = true }
)

-- Extract method
vim.keymap.set(
    'x',
    'crm',
    '<Esc>:lua require("jdtls").extract_method(true)<CR>',
    { noremap = true, silent = true }
)

-- Test class
vim.keymap.set(
    'n',
    '<leader>df',
    ':lua require("jdtls").test_class()<CR>',
    { noremap = true, silent = true }
)

-- Test nearest method
vim.keymap.set(
    'n',
    '<leader>dn',
    ':lua require("jdtls").test_nearest_method()<CR>',
    { noremap = true, silent = true }
)
