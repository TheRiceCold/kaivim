pkgs: build: let
  silicon = build
    "michaelrommel"
    "nvim-silicon"
    "2024-08-31"
    "9fe6001dc8cad4d9c53bcfc8649e3dc76ffa169c"
    "1BeJSpcmZeuIZXrbrxMKvaQBZn2TtsjrFXk26w2In+E=";
in {
  extraPackages = with pkgs; [
    silicon
    jetbrains-mono
    noto-fonts-color-emoji
  ];
  extraPlugins = [ silicon ];

  extraConfigLua = ''
    require'nvim-silicon'.setup {
      theme = 'Dracula',
      no_line_number = true,
      no_window_controls = true,
      font = 'JetBrainsMono Nerd Font=32;Noto Color Emoji=34',
    }
  '';
}
