local function count_buffers()
  local buff_list = vim.api.nvim_exec('ls', true)
  local t = {}
  local count = 0
  for v in buff_list.gmatch(buff_list, "[^\n]+") do
    table.insert(t, v)
  end
  for _ in pairs(t) do
    count = count + 1
  end
  return count
end

local function close_open_buff()
  local count = count_buffers()
  vim.api.nvim_command("bd")

  if count > 2 then
    vim.api.nvim_command("vs")
  elseif count == 2 then
    print("Last buffer")
  end

 end

return {
  close_open_buff = close_open_buff
}
