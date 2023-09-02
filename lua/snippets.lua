-- SNIPPETS
vim.keymap.set(
    'n',
    ',csk',
    ':- 0read $HOME/.config/nvim/skeleton/skeleton.c<CR>4j$',
    { noremap = true }
)

vim.keymap.set(
    'n',
    ',cppsk',
    ':- 0read $HOME/.config/nvim/skeleton/skeleton.cpp<CR>9j$',
    { noremap = true }
)

vim.keymap.set(
    'n',
    ',forsk',
    ':- 0read $HOME/.config/nvim/skeleton/for.cpp<CR>j$',
    { noremap = true }
)

vim.keymap.set(
    'n',
    ',cpppoint',
    ':- 0read $HOME/.config/nvim/skeleton/cpppoint.cpp<CR>55j$',
    { noremap = true }
)

vim.keymap.set(
    'n',
    ',mkfilesk',
    ':- 0read $HOME/.config/nvim/skeleton/MakefileSimple.txt<CR>',
    { noremap = true }
)

vim.keymap.set(
    'n',
    ',cppclass',
    ':- 0read $HOME/.config/nvim/skeleton/cppclasssk.cpp<CR>',
    { noremap = true }
)

vim.keymap.set(
    'n',
    ',ifelse',
    ':- 0read $HOME/.config/nvim/skeleton/ifelse<CR>V4j:s/condition',
    { noremap = true }
)

vim.keymap.set(
    'n',
    ',mktree',
    ':- 0read $HOME/.config/nvim/skeleton/mktree.sh<CR>',
    { noremap = true }
)
