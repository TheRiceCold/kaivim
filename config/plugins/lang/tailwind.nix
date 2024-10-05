{ pkgs, ... }: {
  extraPlugins = let
    builds = import ../builds.nix pkgs;
  in [
    builds.tailwind-fold
    pkgs.vimPlugins.tailwind-tools-nvim
  ];

  extraConfigLua = ''
    require'tailwind-tools'.setup {
      cmp = { highlight = 'foreground' }
    }

    require'tailwind-fold'.setup {
      ft = { 'html', 'astro', 'vue', 'typescriptreact' }
    }
  '';
}
