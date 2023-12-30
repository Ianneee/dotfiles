local function count_buffers()
  local buff_list = vim.api.nvim_exec('ls', true)
  local t = {}
  local count = 0
  for v in buff_list.gmatch(buff_list, "[^\n]+") do
    count = count + 1
  end
  return count
end

local function count_windows_and_position()
  local win_n = vim.api.nvim_list_wins()
  local current_win = vim.api.nvim_get_current_win()
  local total_win = 0
  local pos = 0

  for k, v in pairs(win_n) do
    total_win = total_win + 1
    if v == current_win then
      pos = k
    end
  end
  return total_win, pos
end

local function close_open_buff()
  local count = count_buffers()
  local total_win, pos = count_windows_and_position()

  vim.api.nvim_command("bd")

  if total_win ~= 1 and count > 2 then
    vim.api.nvim_command("vs")
    vim.api.nvim_command("bn")

    if pos == 1 then
      vim.api.nvim_exec("wincmd r", false)
    end

  elseif count == 2 then
    print(" > Last buffer")

  elseif count == 1 then
    print(" > No more buffer to close!")

  end
end

return {
  close_open_buff = close_open_buff
}
