build: pkgs: let
  nvim-silicon = build
    "michaelrommel"
    "nvim-silicon"
    "2024-07-30"
    "feb882f04c992b797daa118101a239fb3bedfc04"
    "Tb20MKihigg2xiy1R0e+7T0ltJHxbp5i8z6+1QQmvg0=";
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
