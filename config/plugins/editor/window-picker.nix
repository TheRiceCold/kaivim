# repo link https://github.com/s1n7ax/nvim-window-picker

build: let
  nvim-window-picker = build
    "s1n7ax"
    "nvim-window-picker"
    "2023-12-17"
    "41cfaa428577c53552200a404ae9b3a0b5719706"
    "D5ikm5Fw0N/AjDL71cuATp1OCONuxPZNfEHuh0vXkq0=";
in {
  extraPlugins = [ nvim-window-picker ];
  extraConfigLua = ''
    require'window-picker'.setup {

    }
  '';
}
