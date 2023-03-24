local setup, lualine = pcall(require, "lualine")

if not setup then
  return
end

-- local lualine_nightfly = require("lualine.themes.nightfly")
--
-- local new_colors = {
--   blue = "#82aaff",
--   green = "#ecc48d",
--   violet = "#ae81ff",
--   yellow = "#FFDA7B",
--   black = "#000000",
-- }
--
-- lualine_nightfly.normal.a.bg = new_colors.blue
-- lualine_nightfly.insert.a.bg = new_colors.green
-- lualine_nightfly.visual.a.bg = new_colors.violet
--
-- lualine_nightfly.normal.b.bg = new_colors.yellow
-- lualine_nightfly.normal.b.fg = new_colors.black
-- lualine_nightfly.insert.b.bg = new_colors.green
-- lualine_nightfly.insert.b.fg = new_colors.black
-- lualine_nightfly.visual.b.bg = new_colors.violet
-- lualine_nightfly.visual.b.fg = new_colors.black
--
-- lualine_nightfly.command = {
--   a = {
--     gui = "bold",
--     bg = new_colors.yellow,
--     fg = new_colors.black,
--   },
-- }

lualine.setup({
  options = {
    icons_enabled = false,
    theme = "Gruvbox",
    -- component_separators = "|",
    component_separators = "-",
    section_separators = "",
    -- section_separators = { left = "", right = "" },
    -- component_separators = { left = "", right = "" },
    -- section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "filename", path = 1 } },
    lualine_c = { "branch", "diff", "diagnostics" },
    lualine_x = { "" },
    lualine_y = { "encoding" },
    lualine_z = { "fileformat", "filetype" },
  },
  -- sections = {
  --   lualine_a = {
  --     { "mode", separator = { left = "" }, right_padding = 2 },
  --   },
  --   lualine_b = { "filename", "branch" },
  --   lualine_c = { "fileformat" },
  --   lualine_x = {},
  --   lualine_y = { "filetype", "progress" },
  --   lualine_z = {
  --     { "location", separator = { right = "" }, left_padding = 2 },
  --   },
  -- },
  -- inactive_sections = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = { "filename" },
  --   lualine_x = { "location" },
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {
    lualine_a = { "buffers" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "tabs" },
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})
