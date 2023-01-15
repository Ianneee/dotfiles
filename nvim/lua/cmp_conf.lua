vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local cmp = require('cmp')

if cmp ~= nil then

  local select_opts = {behavior = cmp.SelectBehavior.Select}

  cmp.setup({

    snippet = {
      expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },

    sources = {
      -- l'ordine indica la priorità o aggiungere `priority = k`
      { name = 'nvim_lsp', keyword_length = 3 },
      { name = 'path' },
      { name = 'buffer', keyword_length = 3 },
      { name = 'nvim_lua' },
      { name = 'ultisnips' },
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
          return item
        end,
      },

    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),

      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({select = true}),

      ['<Tab>'] = cmp.mapping(function(fallback)

        local col = vim.fn.col('.') - 1

        if cmp.visible() then
          cmp.select_next_item(select_opts)
        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          fallback()
        else
          cmp.complete()
        end
      end, {'i', 's'}),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item(select_opts)
        else
          fallback()
        end
      end, {'i', 's'}),
        },
    })

end
