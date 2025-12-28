local wezterm = require('wezterm')
local config = wezterm.config_builder()

config = {
  -- # -- Keybinds
  -- # leader = { key="n", mods="ALT", timeout_milliseconds = 1000 },
  -- # keys = {
  -- #   -- 1) Close Pane (ALT+q)  
  -- #   {
  -- #     key    = "q",
  -- #     mods   = "ALT",
  -- #     action = wezterm.action.CloseCurrentPane({ confirm = false }),
  -- #   },

  -- #  -- ALT+n then l → split right
  -- #   {
  -- #     key    = "l",
  -- #     mods   = "LEADER",
  -- #     action = wezterm.action.SplitPane({
  -- #       direction = "Right",
  -- #       size      = { Percent = 50 },
  -- #     }),
  -- #   },
  -- #   -- ALT+n then h → split left
  -- #   {
  -- #     key    = "h",
  -- #     mods   = "LEADER",
  -- #     action = wezterm.action.SplitPane({
  -- #       direction = "Left",
  -- #       size      = { Percent = 50 },
  -- #     }),
  -- #   },
  -- #   -- ALT+n then j → split down
  -- #   {
  -- #     key    = "j",
  -- #     mods   = "LEADER",
  -- #     action = wezterm.action.SplitPane({
  -- #       direction = "Down",
  -- #       size      = { Percent = 50 },
  -- #     }),
  -- #   },
  -- #   -- ALT+n then k → split up
  -- #   {
  -- #     key    = "k",
  -- #     mods   = "LEADER",
  -- #     action = wezterm.action.SplitPane({
  -- #       direction = "Up",
  -- #       size      = { Percent = 50 },
  -- #     }),
  -- #   },
  -- #   {
  -- #     key    = "Enter",
  -- #     mods   = "ALT",
  -- #     action = wezterm.action.TogglePaneZoomState,
  -- #   },
  -- #   {
  -- #     key    = "h",
  -- #     mods   = "ALT",
  -- #     action = wezterm.action.ActivatePaneDirection("Left"),
  -- #   },
  -- #   {
  -- #     key    = "j",
  -- #     mods   = "ALT",
  -- #     action = wezterm.action.ActivatePaneDirection("Down"),
  -- #   },
  -- #   {
  -- #     key    = "k",
  -- #     mods   = "ALT",
  -- #     action = wezterm.action.ActivatePaneDirection("Up"),
  -- #   },
  -- #   {
  -- #     key    = "l",
  -- #     mods   = "ALT",
  -- #     action = wezterm.action.ActivatePaneDirection("Right"),
  -- #   },
  -- # },
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_background_opacity = 0.15,
  background = {
    {
      source = {
        Color = '#000000',
      },
      opacity = 0.0;
    },
  }
}

return config
