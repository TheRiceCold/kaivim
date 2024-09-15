build: let
  render-markdown = build
    "MeanderingProgrammer"
    "render-markdown.nvim"
    "2024-09-15"
    "ec21879774ffe6dca30913d977b8f22f19a0d049"
    "BhITxvogH5hHO5m1SGNP1sT/jMjaQ0uNqg2ScsyZ/pU=";
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
