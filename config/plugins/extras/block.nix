build: let
  block = build
    "HampusHauffman"
    "block.nvim"
    "2023-10-10"
    "6fb969ab12579e58b9379aa51933cad4a466cf75"
    "dqi4srdtm7TNsFPNcGpV8iwyTL+ov4AEfuQpVnikiYI=";
in {
  extraPlugins = [ block ];
  extraConfigLua = ''
    require'block'.setup {

    }
  '';
}
