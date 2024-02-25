local M = {}

M.hello = function()
  print('Hello da my funcs')
end

M.reopen = function()
  local path = vim.api.nvim_buf_get_name(0)
  vim.api.nvim_command("bd")
  vim.api.nvim_command("e " ..path)
end

return M


