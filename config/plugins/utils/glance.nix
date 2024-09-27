# repo link https://github.com/DNLHC/glance.nvim

build: let
  glance = build
    "DNLHC"
    "glance.nvim"
    "2024-09-13"
    "cdf1ec8136cfbdf73edbe1163097223c763a84b7"
    "grAW5nr9QDQbFS/tZuKHJjJwQLBQGf4EeYsPWHyMSnQ=";
in {
  extraPlugins = [ glance ];
  extraConfigLua = ''
    require'glance'.setup {

    }
  '';
}
