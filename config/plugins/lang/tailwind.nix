pkgs: build: {
  extraPlugins = let
    # LINK: https://github.com/razak17/tailwind-fold.nvim
    tailwind-fold = build
      "razak17"
      "tailwind-fold.nvim"
      "2024-09-30"
      "5544fa59307e4ce5ad3e07ef3ddb231775dc5cda"
      "+TNZB6Hm0EOkFDJtmI46RtH6h/e83qgwHAw49ayGn/I=";
  in [
    tailwind-fold
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
