local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
  return
end

-- recommend setting from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_ntrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        bookmark = "📚",
        folder = {
          -- arrow_closed = "→", -- arrow when folder is closed
          arrow_closed = "+", -- arrow when folder is closed
          -- arrow_open = "↓", -- arrow when folder is open
          arrow_open = "-", -- arrow when folder is open
        },
      },
    },
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  filters = {
    dotfiles = false,
  },
  view = {
    side = "right",
  },
})
