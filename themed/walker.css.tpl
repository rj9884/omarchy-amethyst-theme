@define-color selected-text {{ accent }};
@define-color text {{ foreground }};
@define-color base {{ background }};
@define-color border {{ color8 }};
@define-color foreground {{ foreground }};
@define-color background {{ background }};
@define-color hover {{ accent }};
@define-color selected-box {{ accent }};

/* Completely Eliminate Outer Blurred Boxes, Shadow Frames & Double Borders */
window,
window.background,
window #Window,
.window {
  background: transparent !important;
  background-color: transparent !important;
  border: none !important;
  outline: none !important;
  box-shadow: none !important;
  padding: 0 !important;
  margin: 0 !important;
}

.box-wrapper {
  background-color: {{ background }} !important;
  color: {{ foreground }} !important;
  border: 1px solid alpha({{ color8 }}, 0.3) !important;
  border-radius: 14px !important;
  padding: 12px !important;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5) !important;
}

window .search-container,
window .search,
.search-container {
  background-color: {{ color0 }} !important;
  color: {{ foreground }} !important;
  border: 1px solid alpha({{ color8 }}, 0.25) !important;
  border-radius: 10px !important;
  padding: 6px 14px !important;
  margin-bottom: 8px !important;
}

.input {
  color: {{ foreground }} !important;
  font-size: 14px !important;
}

child {
  border-radius: 8px !important;
  margin: 2px 0 !important;
}

child:selected {
  border-radius: 8px !important;
  background-color: alpha({{ accent }}, 0.2) !important;
  color: {{ accent }} !important;
  box-shadow: none !important;
}

child:selected .item-box * {
  color: {{ accent }} !important;
}

child:hover {
  background-color: alpha({{ accent }}, 0.12) !important;
  color: {{ accent }} !important;
  border-radius: 8px !important;
}
