pkgs: {
  extraPlugins = with pkgs.vimPlugins; [flutter-tools-nvim];

  extraConfigLua = ''
    require'flutter-tools'.setup { }
  '';
}
