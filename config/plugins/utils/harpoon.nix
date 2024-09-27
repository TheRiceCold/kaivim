build: let
  harpoon = build
    "ThePrimeagen"
    "harpoon"
    "2024-06-09"
    "0378a6c428a0bed6a2781d459d7943843f374bce"
    "FZQH38E02HuRPIPAog/nWM55FuBxKp8AyrEldFkoLYk=";
in {
  extraPlugins = [ harpoon ];
  extraConfigLua = ''
    require'harpoon'.setup {

    }
  '';
}
