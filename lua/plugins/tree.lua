-- Nvim-Tree.lua advises to do this at the start.
vim.g.netrw_banner = 0
-- vim.g.netrw_browser_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_list_hide = vim.fn["netrw_gitignore#Hide"]()
vim.g.netrw_list_hide = vim.g.netrw_list_hide .. ',\\(^\\|\\s\\s\\)\\zs\\.\\S+'
