local wezterm = require 'wezterm'

return {
  automatically_reload_config = false,

  window_decorations = "RESIZE",
  color_scheme = "Catppuccin Mocha",

  initial_cols = 160,
  initial_rows = 45,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  native_macos_fullscreen_mode = true,
  adjust_window_size_when_changing_font_size = false,

  font = wezterm.font {
    family = 'Hack Nerd Font',
    stretch = 'Normal',
    weight = 'Bold',
  },
  font_size = 15.0,

  disable_default_key_bindings = true,
  keys = {
    { key = "n", mods = "CMD", action = wezterm.action.SpawnWindow },
    { key = "t", mods = "CMD", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
    { key = "w", mods = "CMD", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
    { key = "h", mods = "CMD", action = wezterm.action { ActivateTabRelative = -1 } },
    { key = "l", mods = "CMD", action = wezterm.action { ActivateTabRelative = 1 } },
    { key = "k", mods = "CMD", action = wezterm.action.IncreaseFontSize },
    { key = "j", mods = "CMD", action = wezterm.action.DecreaseFontSize },
    { key = "c", mods = "CMD", action = wezterm.action { CopyTo = "Clipboard" } },
    { key = "v", mods = "CMD", action = wezterm.action { PasteFrom = "Clipboard" } },
    { key = "f", mods = "CMD", action = wezterm.action.ToggleFullScreen },
  },
}
