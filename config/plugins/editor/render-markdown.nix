# repo link https://github.com/MeanderingProgrammer/render-markdown.nvim

build: let
  render-markdown = build
    "MeanderingProgrammer"
    "render-markdown.nvim"
    "2024-09-15"
    "f187721a5381f4443ef97ad1a7c0681a65511d28"
    "ZsNtowoq25mZDyHfaCKsGfmKrQvWGNAloxXS4fh0yXc=";
in {
  extraPlugins = [ render-markdown ];

  extraConfigLua = ''
    require'render-markdown'.setup {
      heading = {
        icons = { '◉', '○', '✸', '✿', '◉', '○' },
      },
      pipe_table = {
        border = { '╭', '┬', '╮', '├', '┼', '┤', '╰', '┴', '╯', '│', '─' },
      },
      code = {
        left_pad = 2,
        right_pad = 2,
        width = 'block'
      },
    }
  '';
}

