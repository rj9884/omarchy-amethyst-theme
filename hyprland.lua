-- Omarchy Amethyst Theme - Hyprland appearance
local active_border_color = { colors = { "rgba(cba6f7ee)", "rgba(b4befeee)" }, angle = 45 }
local inactive_border_color = "rgba(313244aa)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
    border_size = 2,
    gaps_in = 4,
    gaps_out = 8,
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    rounding = 12,
    active_opacity = 1.0,
    inactive_opacity = 0.9,
    fullscreen_opacity = 1.0,
    blur = {
      enabled = true,
      size = 5,
      passes = 3,
      ignore_opacity = true,
    },
    shadow = {
      enabled = true,
      range = 20,
      render_power = 3,
      color = "rgba(00000066)",
      offset = { 0, 4 },
    },
  },
})

hl.curve("fluent_decel", { type = "bezier", points = { { 0, 0.2 }, { 0.4, 1 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.215, 0.61 }, { 0.355, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "overshot", style = "popin 60%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "overshot", style = "popin 60%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "fluent_decel", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "easeOutCubic", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "fluent_decel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "easeOutCubic", style = "slidefade 15%" })
