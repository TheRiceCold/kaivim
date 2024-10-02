{ pkgs, ... }:
let
  build =
    owner: name: version: rev: hash:
    pkgs.vimUtils.buildVimPlugin {
      pname = name;
      inherit version;
      src = pkgs.fetchFromGitHub {
        repo = name;
        inherit owner rev;
        hash = "sha256-${hash}";
      };
    };
in
{
  imports = [
    ./cmp
    ./lsp
    ./snippet
    ./treesitter
    ./formatting
    # (import ./dap build)
    (import ./git pkgs build)
    (import ./lang pkgs build)
    (import ./utils pkgs build)
    (import ./editing pkgs build)
  ];

  plugins.mini.enable = true;
  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim
    dressing-nvim
  ];
}
