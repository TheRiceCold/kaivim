{ pkgs, ... }: {
  extraPlugins = [ pkgs.vimPlugins.grug-far-nvim ];

  extraConfigLua = ''
    require'grug-far'.setup {

    }
  '';
}
