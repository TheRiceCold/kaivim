# repo link https://github.com/Aasim-A/scrollEOF.nvim

build: let
  scrollEOF = build
    "Aasim-A"
    "scrollEOF.nvim"
    "2024-03-11"
    "38fd5880021e90c15dc61fa325f714bd8077f0a6"
    "n36L6mtayKtXI/orwf0B72sFpgAKZ0HU4vv2UxKexvU=";
in {
  extraPlugins = [ scrollEOF ];
  extraConfigLua = "require'scrollEOF'.setup{ disabled_filetypes = { 'minifiles' } }";
}
