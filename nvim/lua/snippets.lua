local bind = vim.keymap.set
local ls = require("luasnip")

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

require("luasnip.loaders.from_vscode").lazy_load()
