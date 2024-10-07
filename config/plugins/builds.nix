pkgs: let
  build =  version: owner: name: rev: hash:
    pkgs.vimUtils.buildVimPlugin {
      pname = name;
      inherit version;
      src = pkgs.fetchFromGitHub {
        repo = name;
        inherit owner rev;
        hash = "sha256-${hash}";
      };
    };
in {
  # INFO: Last update: Oct 07, 2024 | Sort latest->oldest

  # https://github.com/CWood-sdf/banana.nvim
  banana = build
    "2024-10-01"
    "CWood-sdf"
    "banana.nvim"
    "38df71fce096c035386927d89d3fc9894d3c3d54"
    "oB1U4czlOg6NA3bO0U0M7DMtx/jaztAFFqLJz4Wi5hc=";

  # https://github.com/MagicDuck/grug-far.nvim
  grug-far = build
    "2024-09-30"
    "MagicDuck"
    "grug-far.nvim"
    "b7c2b28e49d55ff71cd9bb3ad19a2021316510d8"
    "qDbRn6abSbQDz6en9aC7dNZSUbeag6HrPwAW4oL6uzM=";

  # https://github.com/razak17/tailwind-fold.nvim
  tailwind-fold = build
    "2024-09-30"
    "razak17"
    "tailwind-fold.nvim"
    "5544fa59307e4ce5ad3e07ef3ddb231775dc5cda"
    "+TNZB6Hm0EOkFDJtmI46RtH6h/e83qgwHAw49ayGn/I=";

  # https://github.com/chomosuke/typst-preview.nvim
  typst-preview = build
    "2024-09-29"
    "chomosuke"
    "typst-preview.nvim"
    "0354cc1a7a5174a2e69cdc21c4db9a3ee18bb20a"
    "n0TfcXJLlRXdS6S9dwYHN688IipVSDLVXEqyYs+ROG8=";

  # https://github.com/SCJangra/ttable-nvim
  table-nvim = build
    "2024-09-27"
    "SCJangra"
    "table-nvim"
    "c044fd37169eb10376962b0d0cec5f94d58ca626"
    "se5bgBCiOcDR8QseFHnVspw7ZGMAzvXYS6Sta/ci9vk=";

  # https://github.com/topaxi/gh-actions.nvim
  gh-actions = build
    "2024-09-20"
    "topaxi"
    "gh-actions.nvim"
    "37be09dfe57531ea8a30143097d7340137092145"
    "S00YM2ULmYiRzVhiGat1mySmYrja8O9E9lVDbUSb/rA=";

  # https://github.com/chrisgrieser/nvim-chainsaw
  chainsaw = build
    "2024-09-19"
    "chrisgrieser"
    "nvim-chainsaw"
    "2af4925afab2591bccb4118475dabfee49744311"
    "jgTLvTY2E99qYScQ1ONgc6eBDJ1fNTPG8qCk2yq2BbM=";

  # https://github.com/michaelrommel/nvim-silicon
  silicon = build
    "2024-08-31"
    "michaelrommel"
    "nvim-silicon"
    "9fe6001dc8cad4d9c53bcfc8649e3dc76ffa169c"
    "1BeJSpcmZeuIZXrbrxMKvaQBZn2TtsjrFXk26w2In+E=";

  # https://github.com/b0o/incline.nvim
  incline = build
    "2024-05-17"
    "b0o"
    "incline.nvim"
    "16fc9c073e3ea4175b66ad94375df6d73fc114c0"
    "5DoIvIdAZV7ZgmQO2XmbM3G+nNn4tAumsShoN3rDGrs=";

  # https://github.com/Aasim-A/scrollEOF.nvim
  scrollEOF = build
    "2024-03-11"
    "Aasim-A"
    "scrollEOF.nvim"
    "38fd5880021e90c15dc61fa325f714bd8077f0a6"
    "n36L6mtayKtXI/orwf0B72sFpgAKZ0HU4vv2UxKexvU=";

  # https://github.com/xiyaowong/telescope-emoji.nvim
  telescope-emoji = build
    "2022-12-08"
    "xiyaowong"
    "telescope-emoji.nvim"
    "86248d97be84a1ce83f0541500ef9edc99ea2aa1"
    "8V3MTporANLtZkH0RuLviWlgMmR6fay0WmZ3ZOQzpKI=";

  # https://github.com/alduraibi/telescope-glyph.nvim
  telescope-glyph = build
    "2022-08-22"
    "alduraibi"
    "telescope-glyph.nvim"
    "f63f01e129e71cc25b79637610674bbf0be5ce9d"
    "6H4afMXtaZn066oBq3z8vvR7WH7WhqZkvziyOXlsNVg=";
}
