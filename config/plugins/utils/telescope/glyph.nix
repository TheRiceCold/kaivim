build: let
  glyph = build
    "alduraibi"
    "telescope-glyph.nvim"
    "2022-08-22"
    "f63f01e129e71cc25b79637610674bbf0be5ce9d"
    "6H4afMXtaZn066oBq3z8vvR7WH7WhqZkvziyOXlsNVg=";
in {
  extraPlugins = [ glyph ];
  extraConfigLua = "require('telescope').load_extension('glyph')";
}
