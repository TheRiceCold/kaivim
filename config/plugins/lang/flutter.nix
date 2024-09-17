{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [ flutter-tools-nvim ];

  extraConfigLua = /* lua */ ''
    require('flutter-tools').setup { }
  '';
}
