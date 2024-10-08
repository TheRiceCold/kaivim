{ pkgs, ... }: {
  extraPackages = [pkgs.ripgrep];
  plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        color_devicons = true;
        vimgrep_arguments = [
          "rg"
          "-L"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
        ];
        prompt_prefix = " ";
        mappings = let
          action = act: "require'telescope.actions'.${act}";
        in {
          i = {
            "<c-k>".__raw = action "preview_scrolling_up";
            "<c-j>".__raw = action "preview_scrolling_down";
          };
          n = {
            "<c-k>".__raw = action "preview_scrolling_up";
            "<c-j>".__raw = action "preview_scrolling_down";
          };
        };
      };
    };
  };

  # Extensions
  extraPlugins = let
    builds = import ../builds.nix pkgs;
  in
    with builds; [
      telescope-emoji
      telescope-glyph
    ];

  extraConfigLua = ''
    local telescope = require'telescope'
    telescope.load_extension('emoji')
    telescope.load_extension('glyph')
  '';
}
