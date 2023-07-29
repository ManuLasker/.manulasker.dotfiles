-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Nebula (base16)'

-- Set background to same color as neovim
config.colors = {}
config.colors.background = '#111111'

config.font = wezterm.font_with_fallback {
  'Berkeley Mono',
  'nonicons',
}

-- default is true, has more "native" look
config.use_fancy_tab_bar = false

-- I don't like putting anything at the ege if I can help it.
config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.tab_bar_at_bottom = true
config.freetype_load_target = "HorizontalLcd"
config.window_background_image = (os.getenv("HOME")..'/.config/xwallpaper/014.jpg')

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.01,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

config.default_prog = { '/usr/bin/zsh', '-c', 'tmux', '--config', '~/.config/tmux/.tmux.conf' }

print(config)

-- and finally, return the configuration to wezterm
return config
