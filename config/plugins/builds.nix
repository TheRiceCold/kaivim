pkgs: let
  build = version: owner: name: rev: hash:
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
  # INFO: Last update: Dec 19, 2024 | Sort latest->oldest
  # https://github.com/CWood-sdf/banana.nvim
  banana = build
    "2024-12-19"
    "CWood-sdf"
    "banana.nvim"
    "2178260de647b48b375663b945af768744ca7061"
    "pNF/7+ONaQAca+oErUBJ9sGmYsDP7+0/6dk7OEMIe9Y=";

  # https://github.com/chrisgrieser/nvim-chainsaw
  chainsaw = build
    "2024-12-18"
    "chrisgrieser"
    "nvim-chainsaw"
    "da7b06461641fa6d7f0ffdd7c1cfa100b0c54728"
    "TaEwkKEqgbpB4IcTFzfFLK65bblOBZ/djjTCg3lmpRk=";

  # https://github.com/chomosuke/typst-preview.nvim
  typst-preview = build
    "2024-12-16"
    "chomosuke"
    "typst-preview.nvim"
    "23db1bd5a32ff0b346817ed72e615c6419b11f48"    
    "uTVE5KgAd9DAYptnqvos5dTjdURlpffj1LW9o/6qkso=";

  # https://github.com/MagicDuck/grug-far.nvim
  grug-far = build
    "2024-12-14"
    "MagicDuck"
    "grug-far.nvim"
    "11d0fbd6fff6f4e394af95319deeaab4ef88ce97"
    "DkVRoxrD/9nlNORGq46CAQvIWjyga+TRvZ74uFKIq8I=";

  # https://github.com/topaxi/pipeline.nvim
  pipeline = build
    "2024-12-12"
    "topaxi"
    "pipeline.nvim"
    "805d918b0ff0811611a40eaa7a662600900044e8"
    "R360qmXENRguzDzP3I7+vMRZ6aCeJm5YcdV51WfRDOQ=";

  # https://github.com/chipsenkbeil/org-roam.nvim
  org-roam = build
    "2024-11-17"
    "chipsenkbeil"
    "org-roam.nvim"
    "59da7daa2b218063936d2fc6363c1eb0667e64f2"
    "R+5vbvOMVlLfPx5xmmx2cG0p+FhO3gFBpVZFvVwJDfM=";

  # https://github.com/TheRiceCold/fzf-lua-projects.nvim
  fzf-lua-projectile = build
    "2024-10-23"
    "TheRiceCold"
    "fzf-lua-projectile"
    "f18f9a1d3c8b2864c90b1e05430ea6d0c1519446"
    "PqMmx3fpbjqGl9EjenGozySgAHCV/AUv6DfxycV44fg=";

  # https://github.com/razak17/tailwind-fold.nvim
  tailwind-fold = build
    "2024-10-18"
    "razak17"
    "tailwind-fold.nvim"
    "30b8c04eec28628fbe554fb4f3a26984c4455176"
    "tfou9Qv7i+o6g81tcp6s3FAVJ/4I3BsTosYtboyGry8=";

  # https://github.com/SCJangra/ttable-nvim
  table-nvim = build
    "2024-09-27"
    "SCJangra"
    "table-nvim"
    "c044fd37169eb10376962b0d0cec5f94d58ca626"
    "se5bgBCiOcDR8QseFHnVspw7ZGMAzvXYS6Sta/ci9vk=";

  # https://github.com/nvim-orgmode/org-bullets.nvim
  org-bullets = build
    "2024-09-02"
    "nvim-orgmode"
    "org-bullets.nvim"
    "46ae687e22192fb806b5977d664ec98af9cf74f6"
    "cRcO0TDY0v9c/H5vQ1v96WiEkIhJDZkPcw+P58XNL9w=";

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
}
