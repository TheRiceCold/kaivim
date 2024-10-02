{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    statix
    selene
    # rubocop
    eslint_d
    htmlhint
    checkstyle
    golangci-lint
    python312Packages.flake8
  ];

  plugins.lint = {
    enable = true;
    lintersByFt = {
      bash = [ "bash" ];
      nix = [ "statix" ];

      html = [ "htmlhint" ];
      go = [ "golangcilint" ];

      java = [ "checkstyle" ];
      lua = [ "luacheck" ];

      javascript = [ "eslint_d" ];
      javascriptreact = [ "eslint_d" ];

      python = [ "flake8" ];

      # ruby = [ "rubocop" ];

      typescript = [ "eslint_d" ];
      typescriptreact = [ "eslint_d" ];
    };
  };
}
