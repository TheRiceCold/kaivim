build: pkgs: let
  telescope-emoji = build
    "xiyaowong"
    "telescope-emoji.nvim"
    "2022-12-08"
    "86248d97be84a1ce83f0541500ef9edc99ea2aa1"
    "8V3MTporANLtZkH0RuLviWlgMmR6fay0WmZ3ZOQzpKI=";
in {
  extraPlugins = [ telescope-emoji ];
  extraConfigLua = "require('telescope').load_extension('emoji')";
}
