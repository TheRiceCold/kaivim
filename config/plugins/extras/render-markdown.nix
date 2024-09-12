build: pkgs: let
  render-markdown = build
    "MeanderingProgrammer"
    "render-markdown.nvim"
    "2024-09-10"
    "a5e2d0b1215814c3d033be1fd8eccf59ce366399"
    "mbqX0+yGMjW3fHtDXVnVh6nUOG6waCW/sAXSQugc33Y=";
in {
  extraPlugins = [ render-markdown ];
  extraConfigLua = ''
    require'render-markdown'.setup {

    }
  '';
}
