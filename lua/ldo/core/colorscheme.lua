-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme nord")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

local opt = vim.opt -- for conciseness

local function set_theme()
  local current_time = os.time()
  local hour = math.floor(current_time / 3600) % 24

  if hour >= 18 or hour <= 6 then
    -- it's night time, so set the theme to a dark theme
    opt.background = "dark"
  else
    -- it's daytime, so set the theme to a light theme
    opt.background = "light"
  end
end

-- set the theme when the script is first run
set_theme()
