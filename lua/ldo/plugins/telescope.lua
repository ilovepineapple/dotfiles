local telescope_setup, telescope = pcall(require, "telescope")

if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")

if not actions_setup then
  return
end

-- configure telescope
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previus, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quick fix list
      },
    },
  },
})

telescope.load_extension("fzf")
