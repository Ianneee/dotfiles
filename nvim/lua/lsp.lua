-- Global configuration
local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

-- Disable lsp messages over text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = false,
        virtual_text = false,
    }
)

-- Show diagnostic window when cursor is over error
vim.o.updatetime = 250
vim.api.nvim_create_autocmd('LspAttach', {
  command = [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]],
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP Keybinds',

  callback = function(ev)
    local bufmap = function(mode, keys, func)
      local opts = {buffer = 0}
      vim.keymap.set(mode, keys, func, opts)
    end

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap({'n', 'v'}, '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')

    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<C-h>', '<cmd>lua vim.diagnostic.setloclist()<cr>')
    bufmap('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    bufmap('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    -- Jumps to the definition of the type symbol
    --bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    --print(string.format('event fired: %s', vim.inspect(ev)))

    bufmap('n', '<leader>sa', '<cmd>vim.lsp.buf.add_workspace_folder<cr>')
    bufmap('n', '<leader>sr', '<cmd>vim.lsp.buf.remove_workspace_folder<cr>')
    bufmap('n', '<leader>sl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)

  end,
})

-- Lsp autoformat file
vim.api.nvim_create_autocmd('LspAttach', {
  command = [[lua vim.api.nvim_buf_create_user_command(0, 'Format',
      function()
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    ]]
})

-- Lsp server init

-- https://pypi.org/project/pyright/
require'lspconfig'.pyright.setup{}

-- require'lspconfig'.dockerls.setup{ }

-- https://github.com/MaskRay/ccls/wiki
--require'lspconfig'.ccls.setup {
--  init_options = {
--    compilationDatabaseDirectory = "build";
--    index = {
--      threads = 0;
--    };
--    clang = {
--      excludeArgs = { "-frounding-math"} ;
--    };
--  }
--}

-- require('lspconfig').yamlls.setup {
--   settings = {
--     yaml = {
--       schemas = {
--         ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.yaml"] = "/*.openapi.yaml"
--       },
--     },
--   }
-- }

-- https://github.com/golang/tools/tree/master/gopls
require'lspconfig'.gopls.setup{}

-- https://clangd.llvm.org/installation.html
require'lspconfig'.clangd.setup{}

-- https://quick-lint-js.com/
require'lspconfig'.quick_lint_js.setup{}

-- require'lspconfig'.vuels.setup{}

-- npm install -g @angular/language-server
require'lspconfig'.angularls.setup{}

-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- npm i -g vscode-langservers-extracted
require'lspconfig'.html.setup {
  capabilities = capabilities,
  filetypes = { "css", "html", "php" }
}

-- npm i -g vscode-langservers-extracted
require'lspconfig'.cssls.setup{}
