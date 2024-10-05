{ pkgs, ... }: let
  theme = "Dracula";
  font = "JetBrainsMono Nerd Font=32;Noto Color Emoji=34";
in {
  extraPackages = with pkgs; [
    silicon
    jetbrains-mono
    noto-fonts-color-emoji
  ];

  extraPlugins = let
    builds = import ../builds.nix pkgs;
  in [builds.silicon];

  extraConfigLua = /*lua*/ ''
    require'nvim-silicon'.setup {
      font = '${font}',
      theme = '${theme}',
      no_line_number = true,
      no_window_controls = true,
    }
  '';
}
