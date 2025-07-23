-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- LSP Configuration for Go (gopls)
local lspconfig = require("lspconfig")

local nvlsp = require "nvchad.configs.lspconfig"

-- LSP Configuration for Go (gopls)
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>fo", function() vim.lsp.buf.format { async = true } end, opts)
end

lspconfig.gopls.setup{
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("go.mod"),
  settings = {
    gopls = {
      analyses = {
        unreachable_code = true,
        unused_params = true,
      },
      staticcheck = true,
    },
  },
}

-- Debugging Configuration with Delve (nvim-dap)
local dap = require('dap')

dap.adapters.go = {
  type = 'server',
  port = 38697,  -- Delve default port
  executable = {
    command = 'dlv',
    args = {'dap', '--listen=:38697', '--headless=true', '--api-version=2'}
  }
}

dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug',
    request = 'launch',
    program = '${file}',
  },
}

