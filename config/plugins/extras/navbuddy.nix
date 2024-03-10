build: pkgs:

let
  navbuddy = build "SmiteshP" "nvim-navbuddy" "2023-09-14" "f137a3466a6cd1965cdcc5398daff54e66eebbe5" "zy1Tq8M5UITNAwtAlFYaUFlHnIZ5LWD9ZLaZcy7ulQ8=";
in {
  plugins.navic = {
    enable = true;
    highlight = true;
    separator = " > ";
  };

  extraPlugins = with pkgs.vimPlugins; [ nui-nvim navbuddy ];

  extraConfigLua = ''
    require('nvim-navbuddy').setup {
      lsp = {
        auto_attach = true, -- If set to true, you don't need to manually use attach function
        preference = nil,   -- list of lsp server names in order of preference
      },
    }
  '';
}
