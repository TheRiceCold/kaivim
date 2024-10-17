{ pkgs, ... }: {
  plugins = {
    nvim-autopairs = {
      enable = true;
      settings = {
        mapBs = false;
        checkTs = true;
        tsConfig = {
          lua = ["string" "source"];
          javascript = ["string" "template_string"];
        };
        disabledFiletypes = ["TelescopePrompt" "minifiles"];
      };
    };

    mini.modules = {
      move = {};
      splitjoin = {};
      trailspace = {};
    };

    twilight.enable = true;
    zen-mode.enable = true;
  };

  extraPlugins = let
    builds = import ../builds.nix pkgs;
  in [builds.scrollEOF pkgs.vimPlugins.vim_current_word];

  extraConfigLua = ''
    require'scrollEOF'.setup{
      disabled_filetypes = { 'minifiles' }
    }

    vim.cmd [[
      let g:vim_current_word#highlight_twins = 0
      let g:vim_current_word#excluded_filetypes = ['minifiles']
    ]]
  '';
}
