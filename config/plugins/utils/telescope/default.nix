pkgs: build: {
  imports = [
    (import ./extensions.nix build)
  ];

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
}
