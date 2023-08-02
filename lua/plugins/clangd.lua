vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

local configs = require("nvim_lsp/configs")
local util = require("nvim_lsp/util")

local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local root_pattern = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")

-- Set up the Clangd configuration for C++ files

lspconfig.clangformat.setup {
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_dir = function(fname)
    -- Use global .clang-format if it exists
    local global_clang_format = vim.fn.glob('~/.clang-format')
    if global_clang_format ~= '' then
      return global_clang_format
    end

    -- Fallback to searching for .clang-format in the project directory
    local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
    return util.root_pattern(".clang-format")(filename) or util.path.dirname(filename)
  end,
  settings = {
    format = {
      style = 'llvm',
      useTab = 'always',
      pointerAlignment = 'Left',
      referenceAlignment = 'Left',
      derivePointerAlignment = false,
      tabWidth = 4,
    }
  }
}

-- Set up ClangFormat language server
-- lspconfig.clangformat.setup {
--   filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
--   root_dir = function(fname)
--     local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
--     return util.root_pattern(".clang-format")(filename) or util.path.dirname(filename)
--   end,
--   settings = {
--     format = {
--       style = 'llvm',
--       useTab = 'always',
--       pointerAlignment = 'Left',
--       referenceAlignment = 'Left',
--       derivePointerAlignment = false,
--       tabWidth = 4,
--     }
--   }
-- }

-- lspconfig.clangformat.setup {
--   filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
--   root_dir = lspconfig.util.root_pattern(".clang-format"),
--   settings = {
--     format = {
--       style = 'llvm',
--       useTab = 'always',
--     }
--   }
-- }

-- vim:et ts=2 sw=2
