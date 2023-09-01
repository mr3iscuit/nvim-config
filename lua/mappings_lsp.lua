-- mappings.lua

local M = {}

function M.setup_mappings(bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set(
        'n',
        '<leader>rn',
        vim.lsp.buf.rename,
        bufopts
    )

    vim.keymap.set(
        'n',
        '<leader>ca',
        vim.lsp.buf.code_action,
        bufopts
    )

    vim.keymap.set(
        'n',
        'gd',
        vim.lsp.buf.definition,
        bufopts
    )

    vim.keymap.set(
        'n',
        'gi',
        vim.lsp.buf.implementation,
        bufopts
    )

    vim.keymap.set(
        'n',
        'gr',
        require('telescope.builtin').lsp_references,
        bufopts
    )

    vim.keymap.set(
        'n',
        'K',
        vim.lsp.buf.hover,
        bufopts
    )

    vim.keymap.set(
        "n",
        "<leader>f",
        vim.lsp.buf.format
    )

    vim.keymap.set(
        'n',
        'gD',
        vim.lsp.buf.declaration,
        bufopts
    )

    -- <C-k> is used somewhere else
    vim.keymap.set(
        'n',
        '<leader>h',
        vim.lsp.buf.signature_help,
        bufopts
    )

    vim.keymap.set(
        'n',
        '<leader>ds',
        '<cmd>Telescope lsp_document_symbols<cr>',
        bufopts
    )

    -- format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
    })
end

return M
