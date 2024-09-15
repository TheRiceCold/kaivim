build: pkgs: let
  nvim-silicon = build
    "michaelrommel"
    "nvim-silicon"
    "2024-08-31"
    "9fe6001dc8cad4d9c53bcfc8649e3dc76ffa169c"
    "1BeJSpcmZeuIZXrbrxMKvaQBZn2TtsjrFXk26w2In+E=";
in {
  extraPlugins = [ nvim-silicon ];
  extraConfigLua = ''
    require'silicon'.setup {
      theme = 'Dracula',
      no_line_number = true,
      no_window_controls = true,
      font = 'JetBrainsMono Nerd Font=34;Noto Color Emoji=34',
		}
  '';
}
