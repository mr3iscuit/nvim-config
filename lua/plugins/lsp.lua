require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "gopls" },
}

local setup_mappings = function (_, bufnr)
    require("mappings_lsp").setup_mappings(bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

-- lspconfig.lua_ls.setup {}
lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
    on_attach = setup_mappings,
    capabilities = capabilities,
}

-- Check if gopls executable exists
local gopls_exists = vim.fn.executable('gopls') == 1
if gopls_exists then
    lspconfig.gopls.setup {
        on_attach    = setup_mappings,
        capabilities = capabilities,
    }
end

-- Check if pyright executable exists
local pyright_exists = vim.fn.executable('pyright') == 1
if pyright_exists then
    lspconfig.pyright.setup {}
end

-- JavaScript/Typescript
local tsserver_exists = vim.fn.executable('tsserver') == 1
if tsserver_exists then
    lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach    = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
        end,
    })
end

-- html
lspconfig.html.setup({
    filetypes    = { "html", },
    capabilities = capabilities,
    on_attach    = setup_mappings,
})

lspconfig.rust_analyzer.setup {
    on_attach = setup_mappings,
    -- Server-specific settings. See `:help lspconfig-setup`
    settings  = {
        ['rust-analyzer'] = {},
    },
}

-- -- Configure the rust-analyzer server
-- lspconfig.rust_analyzer.setup({
--     -- Set the path to the rust-analyzer executable
--     cmd = { 'rust-analyzer' },
--     -- Set any additional options if needed
--     -- For example, to enable the inlay hints feature:
--     on_attach = function(client, bufnr)
--         require("rust-tools").setup(client)
--     end,
--     settings = {
--         ["rust-analyzer"] = {
--             assist = {
--                 inlayHints = true
--             }
--         },
--         rust = {
--             formatting = {
--                 format_on_save = true,
--             },
--         },
--     },
--     capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
-- })
--
-- local rustfmt = require("rust-tools.formatting")
--
-- rustfmt.setup({
--     format_on_save = true,
-- })

-- Java
lspconfig.jdtls.setup({
    on_attach    = setup_mappings,
    capabilities = capabilities,
})
--
-- lspconfig.python.setup({
--     on_attach    = on_attach,
--     capabilities = capabilities,
-- })
--
-- C/C++ LSP
lspconfig.clangd.setup {
    on_attach    = setup_mappings,
    capabilities = capabilities,
}

require("flutter-tools").setup {
    lsp = {
        on_attach = setup_mappings,
    },
    debugger = {
        enabled = true,
        run_via_dap = true,
        register_configurations = function(_)
            require("dap").configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
        end,
    }
}
