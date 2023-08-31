-- SNIPPETS
vim.api.nvim_set_keymap(
    'n',
    ',csk',
    ':- 1read $HOME/.config/nvim/skeleton/skeleton.c<CR>4j$',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    'n',
    ',cppsk',
    ':- 1read $HOME/.config/nvim/skeleton/skeleton.cpp<CR>9j$',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    'n',
    ',forsk',
    ':- 1read $HOME/.config/nvim/skeleton/for.cpp<CR>j$',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    'n',
    ',cpppoint',
    ':- 1read $HOME/.config/nvim/skeleton/cpppoint.cpp<CR>55j$',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    'n',
    ',mkfilesk',
    ':- 1read $HOME/.config/nvim/skeleton/MakefileSimple.txt<CR>',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    'n',
    ',cppclass',
    ':- 1read $HOME/.config/nvim/skeleton/cppclasssk.cpp<CR>',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    'n',
    ',ifelse',
    ':- 1read $HOME/.config/nvim/skeleton/ifelse<CR>V4j:s/condition',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    'n',
    ',mktree',
    ':- 1read $HOME/.config/nvim/skeleton/mktree.sh<CR>',
    { noremap = true }
)
