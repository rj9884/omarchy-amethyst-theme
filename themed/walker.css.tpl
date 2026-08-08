@define-color selected-text {{ accent }};
@define-color text {{ foreground }};
@define-color base {{ background }};
@define-color border {{ color8 }};
@define-color foreground {{ foreground }};
@define-color background {{ background }};
@define-color hover {{ accent }};
@define-color selected-box {{ accent }};

window {
  background: transparent;
}

window .search-container,
window .search {
  background: alpha(@base, 0.95);
  box-shadow: 0 4px 18px rgba(0, 0, 0, 0.4);
  color: @foreground;
  border: 1px solid alpha(@border, 0.3);
  border-radius: 12px;
  padding: 6px 16px;
  font-size: 13px;
  font-weight: 500;
}

.box-wrapper {
  background: alpha(@base, 0.95);
  border: 1px solid alpha(@border, 0.3);
  border-radius: 16px;
  padding: 8px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
}

child:selected {
  border-radius: 10px;
  background-color: alpha(@selected-box, 0.2);
  color: @selected-text;
  box-shadow: none;
  transition: background-color 0.15s ease;
}

child:selected .item-box * {
  color: @selected-text;
}

child:hover {
  background-color: alpha(@hover, 0.12);
  color: @hover;
  border-radius: 10px;
}
