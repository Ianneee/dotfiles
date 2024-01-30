local bind = vim.keymap.set
local ls = require("luasnip")

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.set_config({
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
})

-- Lua snips
bind({"i", "s"}, "<C-l>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end)

bind({"i", "s"}, "<C-h>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true})

bind({"i", "s"}, "<C-k>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "ternary",
    },
    {
      -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
      insert(1, "cond"), text(" ? "), insert(2, "then"), text(" : "), insert(3, "else")
    }),
  },
  sh = {
    snip({
      trig = "shebang-bash",
      namr = "Shebang bash",
      dscr = "Shebang for bash",
    },
    {
      text { "#!/bin/bash", ""},
      insert(0),
    }),

    snip({
      trig = "shebang-shell",
      namr = "Shebang shell",
      dscr = "Shebang for shell"
    },
    {
      text { "#!/bin/sh", ""},
      insert(0),
    }),
  },

  typescript = ({
    snip({
      trig = "cfunction",
      namr = "Class typed function",
    },
    {
      choice(1, {
        text(""),
        text("public "),
        text("private "),
      }),
      insert(2, "function_name"),
      text("("),
      insert(3, "parameters"),
      text("): "),
      insert(4, "return_type"),
      text("{"),
      insert(5),
      text("}")
    }),

  })
})

require("luasnip.loaders.from_vscode").lazy_load()
