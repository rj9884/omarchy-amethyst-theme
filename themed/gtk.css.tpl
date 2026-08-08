/* =============================================================================
   DYNAMIC GTK 3, GTK 4 & LIBADWAITA THEME TEMPLATE FOR OMARCY
   ============================================================================= */

@define-color background     {{ background }};
@define-color foreground     {{ foreground }};
@define-color black          {{ color0 }};
@define-color red            {{ color1 }};
@define-color green          {{ color2 }};
@define-color yellow         {{ color3 }};
@define-color blue           {{ color4 }};
@define-color magenta        {{ color5 }};
@define-color cyan           {{ color6 }};
@define-color white          {{ color7 }};
@define-color bright_black   {{ color8 }};
@define-color bright_red     {{ color9 }};
@define-color bright_green   {{ color10 }};
@define-color bright_yellow  {{ color11 }};
@define-color bright_blue    {{ color12 }};
@define-color bright_magenta {{ color13 }};
@define-color bright_cyan    {{ color14 }};
@define-color bright_white   {{ color15 }};

@define-color accent_bg_color {{ accent }};
@define-color accent_fg_color {{ background }};
@define-color accent_color {{ accent }};

@define-color window_bg_color {{ background }};
@define-color window_fg_color {{ foreground }};

@define-color view_bg_color {{ background }};
@define-color view_fg_color {{ foreground }};
@define-color sidebar_bg_color {{ background }};
@define-color sidebar_fg_color {{ foreground }};

@define-color headerbar_bg_color {{ background }};
@define-color headerbar_fg_color {{ foreground }};
@define-color headerbar_backdrop_color {{ background }};
@define-color headerbar_shade_color {{ background }};
@define-color card_bg_color {{ color0 }};
@define-color card_fg_color {{ foreground }};

@define-color borders {{ color8 }};

@define-color theme_fg_color {{ foreground }};
@define-color theme_text_color {{ foreground }};
@define-color theme_bg_color {{ background }};
@define-color theme_base_color {{ background }};
@define-color theme_selected_bg_color {{ accent }};
@define-color theme_selected_fg_color {{ background }};

@define-color popover_bg_color {{ color0 }};
@define-color popover_fg_color {{ foreground }};
@define-color popover_border_color transparent;
@define-color popover_shade_color {{ background }};
@define-color dialog_bg_color {{ color0 }};
@define-color dialog_fg_color {{ foreground }};

/* Base Window, Nautilus, Text Editor & Application Backgrounds */
window,
window.csd,
window.background,
.background,
nautilus-window,
.nautilus-window,
window.nautilus-window,
.nautilus-window .background,
.nautilus-window headerbar,
.nautilus-window .titlebar,
.nautilus-window .navigation-sidebar,
.nautilus-window .sidebar,
.nautilus-window view,
.nautilus-window gridview,
.nautilus-window columnview,
.nautilus-window listview,
.nautilus-window splitview,
.nautilus-window adw-bin,
.nautilus-window adw-view-stack,
.nautilus-window adw-tab-bar,
headerbar,
headerbar.titlebar,
.titlebar,
toolbar.osd,
.osd,
.osd toolbar,
.osd headerbar,
windowtitle,
windowheader,
view,
.view,
viewport,
stack,
scrolledwindow,
list,
listview,
columnview,
treeview,
gridview,
filechooser,
.navigation-sidebar,
filechooser .sidebar,
splitview,
splitview > box,
adw-flap,
adw-navigation-view,
adw-toolbar-view,
adw-header-bar,
adw-view-stack,
sourceview,
sourceview text,
textview,
textview text,
editor,
.editor {
  background-color: @window_bg_color;
  color: @window_fg_color;
}

/* HeaderBar Seamless Alignment */
headerbar,
headerbar.titlebar,
.titlebar,
adw-header-bar,
toolbar.osd,
.osd,
.osd toolbar,
.osd headerbar,
windowtitle,
windowheader {
  border: none;
  border-bottom: none;
  box-shadow: none;
  margin: 0;
}

headerbar box,
headerbar.titlebar box,
.titlebar box,
headerbar:backdrop,
.titlebar:backdrop,
headerbar > box,
.titlebar > box {
  border: none;
  border-bottom: none;
  box-shadow: none;
  margin: 0;
  padding: 0;
}

/* Tab Bar & Underline Fixes */
tabbar,
tabbar tab,
tabbox,
tabbox tab,
tab,
.nautilus-window tabbar,
.nautilus-window tab {
  border: none;
  box-shadow: none;
  background-color: @window_bg_color;
}

tabbar indicator,
tab indicator,
.nautilus-window tab indicator {
  background-color: transparent;
  border: none;
}

/* Buttons in Headerbar */
headerbar button,
.titlebar button,
window.csd headerbar button,
window.csd .titlebar button,
dialog headerbar button,
dialog actionbar button,
filechooser headerbar button,
button.flat,
button.text-button {
  background-color: transparent;
  background-image: none;
  color: @foreground;
  border: none;
  outline: none;
  box-shadow: none;
  padding: 4px 10px;
  border-radius: 6px;
  font-weight: 500;
  margin: 0;
}

headerbar button:hover,
.titlebar button:hover,
window.csd headerbar button:hover,
window.csd .titlebar button:hover,
dialog headerbar button:hover,
dialog actionbar button:hover,
filechooser headerbar button:hover,
button.flat:hover,
button.text-button:hover {
  background-color: rgba({{ accent_rgb }}, 0.18);
  color: @accent_color;
  border: none;
  outline: none;
  box-shadow: none;
}

button.suggested-action,
headerbar button.suggested-action,
filechooser button.suggested-action,
headerbar button:active,
button:active {
  background-color: @accent_color;
  color: @background;
  border: none;
  outline: none;
  box-shadow: none;
  font-weight: bold;
  padding: 4px 12px;
  border-radius: 6px;
}

/* Row Hover and Selection Colors */
treeview row:hover,
treeview.view row:hover,
list row:hover,
listview row:hover,
columnview row:hover,
gridview child:hover,
flowbox child:hover,
filechooser treeview row:hover,
filechooser listview row:hover,
filechooser columnview row:hover,
filechooser .sidebar row:hover,
.navigation-sidebar row:hover {
  background-color: rgba({{ accent_rgb }}, 0.18);
  color: @accent_color;
  border: none;
  outline: none;
  box-shadow: none;
}

treeview row:hover label,
treeview row:hover image,
treeview row:hover icon,
listview row:hover label,
columnview row:hover label,
filechooser treeview row:hover label,
filechooser .sidebar row:hover label,
.navigation-sidebar row:hover label {
  color: @accent_color;
}

treeview:selected,
treeview row:selected,
list row:selected,
listview row:selected,
columnview row:selected,
gridview child:selected,
flowbox child:selected,
filechooser treeview row:selected,
filechooser listview row:selected,
filechooser columnview row:selected,
filechooser .sidebar row:selected,
.navigation-sidebar row:selected,
row:selected,
*:selected {
  background-color: @accent_color;
  color: @background;
  font-weight: bold;
  border: none;
  outline: none;
  box-shadow: none;
}

treeview:selected label,
treeview:selected image,
treeview:selected icon,
treeview row:selected label,
treeview row:selected image,
treeview row:selected icon,
list row:selected label,
listview row:selected label,
columnview row:selected label,
gridview child:selected label,
filechooser treeview row:selected label,
filechooser .sidebar row:selected label,
.navigation-sidebar row:selected label,
row:selected label,
row:selected image,
row:selected icon {
  color: @background;
}

/* Completely Remove Extra Background Boxes, Thick Borders & Outer Shadow Glow Boxes */
popover,
popover.menu,
popover.background,
popover > arrow,
popover > contents > arrow,
window.quick-preview,
.sushi-viewport,
.file-properties {
  background-color: transparent;
  background-image: none;
  color: @foreground;
  border: none;
  box-shadow: none;
  padding: 0;
  margin: 0;
}

popover > contents,
popover.menu > contents,
.menu,
menu,
.context-menu,
.dropdown {
  background-color: @card_bg_color;
  color: @foreground;
  border: none;
  outline: none;
  box-shadow: none;
  border-radius: 10px;
  padding: 6px;
}

popover box,
popover stack,
popover listview,
popover .view,
popover.menu box,
popover.menu stack,
popover.menu listview {
  background-color: transparent;
  border: none;
  box-shadow: none;
}

dialog,
dialog.background {
  background-color: transparent;
  background-image: none;
  border: none;
  box-shadow: none;
}

dialog > box,
dialog .dialog-vbox,
window.dialog {
  background-color: @card_bg_color;
  color: @foreground;
  border-radius: 12px;
  border: none;
  box-shadow: none;
}

popover modelbutton,
popover.menu modelbutton,
menuitem,
.menuitem {
  min-height: 28px;
  padding: 4px 10px;
  border-radius: 6px;
  color: @foreground;
  border: none;
  box-shadow: none;
}

popover modelbutton:hover,
popover.menu modelbutton:hover,
menuitem:hover,
.menuitem:hover {
  background-color: rgba({{ accent_rgb }}, 0.18);
  color: @accent_color;
  border: none;
  box-shadow: none;
}
