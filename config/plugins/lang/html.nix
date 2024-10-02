build: let
  banana = build
    "CWood-sdf"
    "banana.nvim"
    "2024-09-26"
    "b2e97adb5d8f07269c014da4c9a3b7d4a53e1274"
    "cVAgEzw3+/xhcU2luO9HiXzltZzSz+Zi4dkzFGP0U4Y=";
in {
  # html renderer
  extraPlugins = [banana];
}
