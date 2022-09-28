-- Global configuration
local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
  end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

-- Disable signs
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = false,
        virtual_text = false,
    }
)

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP Keybinds',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = 0}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<C-h>', '<cmd>lua vim.diagnostic.setloclist()<cr>')
    bufmap('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    bufmap('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    -- Jumps to the definition of the type symbol
    --bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    -- Renames all references to the symbol under the cursor
    --bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
  end
})

-- Lsp server init
require'lspconfig'.pyright.setup{}

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        -- vim as global variable
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
