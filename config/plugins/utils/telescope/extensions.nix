build: {
  extraPlugins = let
    # Link: https://github.com/xiyaowong/telescope-emoji.nvim
    emoji = build
      "xiyaowong"
      "telescope-emoji.nvim"
      "2022-12-08"
      "86248d97be84a1ce83f0541500ef9edc99ea2aa1"
      "8V3MTporANLtZkH0RuLviWlgMmR6fay0WmZ3ZOQzpKI=";

    # Link: https://github.com/alduraibi/telescope-glyph.nvim
    glyph = build
      "alduraibi"
      "telescope-glyph.nvim"
      "2022-08-22"
      "f63f01e129e71cc25b79637610674bbf0be5ce9d"
      "6H4afMXtaZn066oBq3z8vvR7WH7WhqZkvziyOXlsNVg=";
  in [emoji glyph];

  extraConfigLua = ''
    local telescope = require'telescope'
    telescope.load_extension('emoji')
    telescope.load_extension('glyph')
  '';
}
