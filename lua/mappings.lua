local map = vim.keymap.set
local opts = { silent = true }

-- WIKILINKS
_G.run_grep = function()
    local handle = io.popen("grep -rhoP '\\[\\[(.+?)]]' -r . --include='*.md'")
    local output = handle:read("*a")
    handle:close()

    -- Open output in a new tab
    vim.api.nvim_command('tabnew')
    vim.api.nvim_command('setlocal buftype=nofile')
    vim.api.nvim_buf_set_lines(0, 0, -1, true, vim.split(output, "\n"))
    vim.api.nvim_buf_set_option(0, 'modifiable', false)
end

vim.api.nvim_set_keymap('n', ',wl', ':lua run_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ççül', ':lua run_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'ççül', ':lua run_grep()<CR>', { noremap = true, silent = true })

-- pipe in azerbaijani layout
vim.api.nvim_set_keymap('n', '<leder>\\', 'i|<esc>', { noremap = true })

-- double brace
-- normal mode
vim.api.nvim_set_keymap('n', 'çço', 'a[[<esc>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ççc', 'a]]<esc>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ççü', 'a[[|]]<esc>hh', { noremap = true })
vim.api.nvim_set_keymap('n', 'ççp', 'a|<esc>', { noremap = true })

-- insert mode
vim.api.nvim_set_keymap('i', 'çço', '[[', { noremap = true })
vim.api.nvim_set_keymap('i', 'ççc', ']]', { noremap = true })
vim.api.nvim_set_keymap('i', 'ççü', '<esc>i [[|<esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', 'ççp', '|', { noremap = true })

-- WIKILINKS\

-- SNIPPETS
vim.api.nvim_set_keymap('n', ',csk', ':- 1read $HOME/.config/nvim/skeleton/skeleton.c<CR>4j$', { noremap = true })
vim.api.nvim_set_keymap('n', ',cppsk', ':- 1read $HOME/.config/nvim/skeleton/skeleton.cpp<CR>9j$', { noremap = true })
vim.api.nvim_set_keymap('n', ',forsk', ':- 1read $HOME/.config/nvim/skeleton/for.cpp<CR>j$', { noremap = true })
vim.api.nvim_set_keymap('n', ',cpppoint', ':- 1read $HOME/.config/nvim/skeleton/cpppoint.cpp<CR>55j$', { noremap = true })
vim.api.nvim_set_keymap('n', ',mkfilesk', ':- 1read $HOME/.config/nvim/skeleton/MakefileSimple.txt<CR>',
    { noremap = true })
vim.api.nvim_set_keymap('n', ',cppclass', ':- 1read $HOME/.config/nvim/skeleton/cppclasssk.cpp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', ',ifelse', ':- 1read $HOME/.config/nvim/skeleton/ifelse<CR>V4j:s/condition',
    { noremap = true })
vim.api.nvim_set_keymap('n', ',mktree', ':- 1read $HOME/.config/nvim/skeleton/mktree.sh<CR>', { noremap = true })

-- Mapping for visual mode to copy the selected text to the clipboard
vim.api.nvim_set_keymap('v', ',cp', ':w !wl-copy<CR><Esc>', { noremap = true })

-- Set space as leader
vim.g.mapleader = ","

-- Map
map("n", "<Leader>w", "<C-w>")

-- Better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")


-- Resizing panes
vim.api.nvim_set_keymap('n', '<C-h>', ':vertical resize +4<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':resize +1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':resize -1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':vertical resize -4<CR>', { noremap = true })

-- focus between splits Ctrl+{hjkl}
-- vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true })


-- Join lines without moving the curser to the end
map("n", "J", "mzJ`z")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Half page jumping and curser stays in the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Center after search and jumps
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste and without overwriting register
map("x", "<leader>p", [["_dP]])

-- Delete and without overwriting register
map({ "n", "v" }, "<leader>d", [["_d]])

-- Easier window switching with leader + Number
for i = 1, 6 do
    local lhs = "<Leader>" .. i
    local rhs = i .. "<C-W>w"
    map("n", lhs, rhs, { desc = "Move to Window " .. i })
end

-- Terminal
map({ "n", "t" }, "<leader>t", "<Cmd>ToggleTerm<CR>")
map({ "n", "t" }, "<C-t>", "<Cmd>ToggleTerm<CR>")

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })

map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)
map('n', '<esc>', '<cmd>NvimTreeClose<cr>', opts)

-- Telescope
map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- -- Harpoon
-- vim.keymap.set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
-- vim.keymap.set("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
-- vim.keymap.set("n", "<C-h>", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true })
-- vim.keymap.set("n", "<C-j>", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true })
-- vim.keymap.set("n", "<C-k>", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true })
-- vim.keymap.set("n", "<C-l>", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true })

-- Undotree
vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map('n', '<leader>i', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

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

local NS = { noremap = true, silent = true }

vim.keymap.set('x', 'aa', function() require 'align'.align_to_char(1, true) end, NS)             -- Aligns to 1 character, looking left
vim.keymap.set('x', 'as', function() require 'align'.align_to_char(2, true, true) end, NS)       -- Aligns to 2 characters, looking left and with previews
vim.keymap.set('x', 'aw', function() require 'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
vim.keymap.set('x', 'ar', function() require 'align'.align_to_string(true, true, true) end, NS)  -- Aligns to a Lua pattern, looking left and with previews

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
    NS
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
    NS
)
