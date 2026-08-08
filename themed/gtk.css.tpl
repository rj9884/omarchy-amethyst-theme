/* =============================================================================
   DYNAMIC GTK 3, GTK 4 & LIBADWAITA THEME TEMPLATE FOR OMARCY (COMPACT DESIGN)
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

/* Window & HeaderBar Rounded Corners */
window,
window.csd,
window.background,
.background,
nautilus-window,
.nautilus-window,
window.nautilus-window,
window.dialog,
window.quick-preview,
dialog.background {
  border-radius: 10px;
}

headerbar,
headerbar.titlebar,
.titlebar,
adw-header-bar {
  border-radius: 10px 10px 0 0;
}

/* Base Window, Nautilus, Text Editor & Application Backgrounds */
window,
window.csd,
window.background,
window.quick-preview,
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
.editor,
.sushi-viewport,
window.quick-preview {
  background-color: @window_bg_color;
  color: @window_fg_color;
}

/* HeaderBar Background Stability Across ALL States */
headerbar,
headerbar.titlebar,
.titlebar,
adw-header-bar,
headerbar:hover,
headerbar:focus,
headerbar:focus-within,
headerbar:backdrop,
.titlebar:hover,
.titlebar:focus,
.titlebar:backdrop,
adw-header-bar:hover,
adw-header-bar:focus,
adw-header-bar:backdrop,
filechooser headerbar,
filechooser headerbar:hover,
filechooser headerbar:focus,
filechooser headerbar:backdrop,
windowtitle,
windowheader {
  background-color: @window_bg_color;
  color: @window_fg_color;
  border: none;
  border-bottom: none;
  box-shadow: none;
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
}

/* Compact PathBar / Navigation Address Bar */
pathbar,
.path-bar {
  margin: 0 4px;
  padding: 1px 2px;
}

pathbar button,
.path-bar button {
  padding: 2px 6px;
  margin: 0 1px;
  border-radius: 4px;
  background-color: transparent;
  color: @foreground;
  border: none;
}

pathbar button image,
pathbar button icon,
.path-bar button image,
.path-bar button icon {
  margin-right: 4px;
}

pathbar button label,
.path-bar button label {
  margin-left: 1px;
  margin-right: 1px;
}

pathbar button:hover,
.path-bar button:hover {
  background-color: rgba({{ accent_rgb }}, 0.18);
  color: @accent_color;
}

/* Compact Sidebar Row Spacing */
.navigation-sidebar row,
filechooser .sidebar row,
placesview row,
.sidebar-row,
sidebar row,
.navigation-sidebar listview row,
filechooser listview row,
.navigation-sidebar treeview row,
filechooser treeview row {
  min-height: 28px;
  padding: 3px 8px;
  margin: 1px 2px;
  border-radius: 6px;
  color: @foreground;
}

.navigation-sidebar row label,
filechooser .sidebar row label,
placesview row label,
.sidebar-row label {
  color: @foreground;
  font-size: 13px;
  margin-left: 6px;
}

.navigation-sidebar row image,
filechooser .sidebar row image,
placesview row image,
.sidebar-row image {
  margin-right: 6px;
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

/* Compact Buttons in Headerbar & Dialogs */
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
  padding: 3px 8px;
  border-radius: 5px;
  font-weight: 500;
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

/* Suggested Action Buttons ("Select", "Save", "Open") */
button.suggested-action,
headerbar button.suggested-action,
filechooser button.suggested-action,
dialog button.suggested-action,
button.suggested-action:hover,
headerbar button.suggested-action:hover,
filechooser button.suggested-action:hover,
dialog button.suggested-action:hover,
button.suggested-action:focus,
headerbar button.suggested-action:focus,
filechooser button.suggested-action:focus,
dialog button.suggested-action:focus {
  background-color: @accent_color;
  color: @background;
  border: none;
  outline: none;
  box-shadow: none;
  font-weight: bold;
  padding: 3px 12px;
  border-radius: 5px;
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

/* Single Layer Popovers, Context Menus & Dialogs */
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
  border-radius: 8px;
  padding: 4px;
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
  border-radius: 10px;
  border: none;
  box-shadow: none;
}

popover modelbutton,
popover.menu modelbutton,
menuitem,
.menuitem {
  min-height: 24px;
  padding: 3px 8px;
  border-radius: 5px;
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

/* Dynamic Toast Banner Notifications (e.g. "37 files moved to trash") */
toast,
.toast,
toast.background,
adw-toast,
adw-toast-overlay toast {
  background-color: @card_bg_color;
  color: @foreground;
  border-radius: 9999px;
  border: 1px solid rgba({{ accent_rgb }}, 0.3);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
  padding: 6px 16px;
}

toast label,
.toast label {
  color: @foreground;
  font-weight: bold;
}

toast button,
.toast button {
  background-color: transparent;
  color: @accent_color;
  font-weight: bold;
  border: none;
  box-shadow: none;
  padding: 4px 10px;
  border-radius: 9999px;
}

toast button:hover,
.toast button:hover {
  background-color: rgba({{ accent_rgb }}, 0.18);
  color: @accent_color;
}

toast button.close,
.toast button.close {
  color: @foreground;
}
