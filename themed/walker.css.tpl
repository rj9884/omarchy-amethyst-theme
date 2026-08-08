@define-color selected-text {{ accent }};
@define-color text {{ foreground }};
@define-color base {{ background }};
@define-color border {{ color8 }};
@define-color foreground {{ foreground }};
@define-color background {{ background }};
@define-color hover {{ accent }};
@define-color selected-box {{ accent }};

/* Universal Rounded Corners for Walker Launcher Windows & Containers */
window,
window.background,
window.dmenu,
window #Window,
.window,
#Window,
.dmenu,
#dmenu,
.dmenu-box,
.box-wrapper,
#BoxWrapper,
.box,
#Box,
scrolledwindow,
.scroll,
.content-container,
.list {
  background-color: {{ background }} !important;
  color: {{ foreground }} !important;
  border-radius: 16px !important;
  border: 1px solid alpha({{ color8 }}, 0.3) !important;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5) !important;
  overflow: hidden !important;
}

window .search-container,
window .search,
.search-container,
#SearchContainer {
  background-color: {{ color0 }} !important;
  color: {{ foreground }} !important;
  border: 1px solid alpha({{ color8 }}, 0.25) !important;
  border-radius: 12px !important;
  padding: 6px 14px !important;
  margin-bottom: 8px !important;
}

.input {
  color: {{ foreground }} !important;
  font-size: 14px !important;
}

child,
child > *,
.item-box,
.item-text-box {
  border-radius: 8px !important;
  margin: 2px 0 !important;
}

child:selected,
child:selected *,
child:selected .item-box,
child:selected .item-text-box {
  border-radius: 8px !important;
  background-color: alpha({{ accent }}, 0.2) !important;
  color: {{ accent }} !important;
  box-shadow: none !important;
}

child:selected .item-box * {
  color: {{ accent }} !important;
}

child:hover,
child:hover *,
child:hover .item-box {
  background-color: alpha({{ accent }}, 0.12) !important;
  color: {{ accent }} !important;
  border-radius: 8px !important;
}
