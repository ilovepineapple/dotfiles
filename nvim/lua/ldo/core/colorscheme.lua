local status, gruvbox = pcall(require, "gruvbox")

if not status then
  print("Colorscheme not found")
  return
end

gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")

-- local status, _ = pcall(vim.cmd, "colorscheme dracula")
-- if not status then
--   print("Colorscheme not found!") -- print error if colorscheme not installed
--   return
-- end

-- local opt = vim.opt -- for conciseness

-- local function set_theme()
--   local current_time = os.time()
--   local hour = math.floor(current_time / 3600) % 24
--
--   if hour >= 18 or hour <= 6 then
--     -- it's night time, so set the theme to a dark theme
--     opt.background = "dark"
--   else
--     -- it's daytime, so set the theme to a light theme
--     opt.background = "light"
--   end
-- end

-- set the theme when the script is first run
-- set_theme()
