general {
    ignore_empty_input = true
    no_fade_in = false
    no_fade_out = false
    grace = 3
}

background {
    monitor =
    color = rgba({{ background_rgb }}, 0.85)
    path = ~/.config/omarchy/current/background

    blur_passes = 4
    blur_size = 12
    noise = 0.0117
    contrast = 0.85
    brightness = 0.6
    vibrancy = 0.25
    vibrancy_darkness = 0.15
}

animations {
    enabled = true
}

# ── Greeting ──
label {
    monitor =
    text = cmd[update:3600] echo "Good $(date +'%p' | sed 's/AM/morning/;s/PM/evening/')"
    color = rgba({{ accent_rgb }}, 0.5)
    font_size = 14
    font_family = JetBrainsMono Nerd Font
    position = 0, 260
    halign = center
    valign = center
}

# ── Clock ──
label {
    monitor =
    text = cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"
    color = rgba({{ foreground_rgb }}, 0.7)
    font_size = 160
    font_family = JetBrainsMono Nerd Font
    position = 0, 120
    halign = center
    valign = center
}

# ── AM/PM ──
label {
    monitor =
    text = cmd[update:1000] echo "$(date +'%p')"
    color = rgba({{ foreground_rgb }}, 0.45)
    font_size = 36
    font_family = JetBrainsMono Nerd Font
    position = 310, 108
    halign = center
    valign = center
}

# ── Date ──
label {
    monitor =
    text = cmd[update:3600] echo "$(date +'%A, %B %d')"
    color = rgba({{ accent_rgb }}, 0.75)
    font_size = 17
    font_family = JetBrainsMono Nerd Font
    position = 0, -60
    halign = center
    valign = center
}

# ── Decorative line ──
label {
    monitor =
    text = ─── ✦ ───
    color = rgba({{ accent_rgb }}, 0.18)
    font_size = 13
    font_family = JetBrainsMono Nerd Font
    position = 0, -90
    halign = center
    valign = center
}

# ── Input field ──
input-field {
    monitor =
    size = 550, 80
    position = 0, -220
    halign = center
    valign = center

    inner_color = rgba({{ background_rgb }}, 0.6)
    outer_color = rgba({{ accent_rgb }}, 0.5)
    outline_thickness = 1.5

    font_family = JetBrainsMono Nerd Font
    font_color = rgba({{ foreground_rgb }}, 1.0)
    font_size = 22

    placeholder_text = <i>Password</i>
    dots_center = true
    dots_spacing = 0.5
    dots_size = 0.15

    check_color = rgba(166, 227, 161, 0.8)
    fail_color = rgba(243, 139, 168, 0.9)
    fail_text = <i>✗ Wrong Password</i>
    fail_inner_color = rgba(243, 139, 168, 0.15)
    fail_outer_color = rgba(243, 139, 168, 0.7)
    capslock_color = rgba(249, 226, 175, 0.8)
    capslock_text = <i>⇪ Caps Lock</i>
    highlight = rgba({{ accent_rgb }}, 0.25)
    highlight_outer_color = rgba({{ accent_rgb }}, 0.4)
    highlight_focus = 1

    rounding = 24

    shadow_passes = 3
    shadow_size = 6
    shadow_color = rgba(0, 0, 0, 0.4)
    fade_on_empty = false
    transition_time = 150
}

# ── Bottom hint ──
label {
    monitor =
    text = Press ↵  to unlock  ·  Esc to cancel
    color = rgba({{ foreground_rgb }}, 0.25)
    font_size = 11
    font_family = JetBrainsMono Nerd Font
    position = 0, -270
    halign = center
    valign = center
}

auth {
    fingerprint:enabled = false
}
