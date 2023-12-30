vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local cmp = require('cmp')

if cmp ~= nil then

  local select_opts = {behavior = cmp.SelectBehavior.Select}

  cmp.setup({

    snippet = {
      expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

    sources = {
      -- l'ordine indica la priorità o aggiungere `priority = k`
      { name = 'luasnip' },
      { name = 'nvim_lsp', keyword_length = 3,
        -- Disable LSP snippets
        entry_filter = function(entry)
                    return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
                end },
      { name = 'buffer', keyword_length = 3 },
      { name = 'path' },
      { name = 'nvim_lua' },
    },

    window = {
      completion = {
        scrolloff = 2
      },
      documentation = {
        max_width = 80
      }
    },

    formatting = {
      fields = { 'abbr', 'kind', 'menu' },
      format = function(entry, item)
        local menu_icon = {
          nvim_lsp = '[LSP]',
          luasnip = '[Snip]',
          buffer = '[Buf]',
          path = '[Path]',
          latex_symbols = '[LaTeX]',
          nvim_lua = '[Lua]'
        }

        item.menu = menu_icon[entry.source.name]

        if (string.len(item.abbr) > 50) then
          item.abbr = string.sub(item.abbr, 1, 50) .. ".."
        end

        return item
      end,
      },

    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),

      --['<C-e>'] = cmp.mapping.abort(), -- cmp.mapping.close()

      ['<CR>'] = cmp.mapping.confirm({select = true}),
      ['<C-y>'] = cmp.mapping.confirm({select = true}),

      --['<C-Space>'] = cmp.mapping.complete(),
      ['<C-Space>'] = function()
          if cmp.visible() then
            cmp.abort()
          else
            cmp.complete()
          end
        end

      --['<Tab>'] = cmp.mapping(function(fallback)

      --  local col = vim.fn.col('.') - 1

      --  if cmp.visible() then
      --    cmp.select_next_item(select_opts)
      --  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      --    fallback()
      --  else
      --    cmp.complete()
      --  end
      --end, {'i', 's'}),

      --['<S-Tab>'] = cmp.mapping(function(fallback)
      --  if cmp.visible() then
      --    cmp.select_prev_item(select_opts)
      --  else
      --    fallback()
      --  end
      --end, {'i', 's'}),
      },
    })

end
