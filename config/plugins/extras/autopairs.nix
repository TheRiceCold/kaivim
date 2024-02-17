{ build, ... }:
let
  ultimate-autopair = build "altermo" "ultimate-autopair.nvim" "2024-02-07" "07c9da3e7722107163b68ecc5e0141fdd825449d" "TmmajuK1iOmRki4hLVFKK/w2Hf2aCh9GoOUxg5z+UZk=";
in {
  config = {
    extraPlugins = [ ultimate-autopair ];
    extraConfigLua = "require('ultimate-autopair').setup()";
  };
}
