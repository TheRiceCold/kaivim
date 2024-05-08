build: pkgs: let
  nvim-silicon = build 
    "michaelrommel"
    "nvim-silicon"
    "2024-03-06"
    "ab664633e5090809da7470288404fe5b8735a8c8"
    "iNKwV2KuwnymnFlQIgc1RSkDL41p28PbIFRM0iAFbMw=";
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
