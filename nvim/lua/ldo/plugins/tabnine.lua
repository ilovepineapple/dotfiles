local setup, tabnine = pcall(require, "tabnine")

if not setup then
  return
end

tabnine.setup({
  disable_auto_comment = true,
  accept_keymap = "<Tab>",
  -- accept_keymap = "<C-[>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  execlude_filetypes = { "TelescopePrompt" },
})
