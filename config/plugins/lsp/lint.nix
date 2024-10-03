{ pkgs, ... }: {
  extraPackages = with pkgs; [
    statix
    selene

    eslint_d
    stylelint

    yamllint
    sqlfluff

    markdownlint-cli2

    ruff
    rubocop
    vala-lint
    checkstyle
    golangci-lint
    python312Packages.flake8

    clippy
    cppcheck
    cmake-lint
  ];

  plugins.lint = {
    enable = true;
    lintersByFt = {
      bash = ["bash"];
      nix = ["statix"];
      lua = ["selene"];

      css = ["stylelint"];
      javascript = ["eslint_d"];
      javascriptreact = ["eslint_d"];
      typescript = ["eslint_d"];
      typescriptreact = ["eslint_d"];

      sql = ["sqlfluff"];

      yaml = ["yamllint"];

      markdown = ["markdownlint-cli2"];

      vala = ["vala"];
      python = ["ruff"];
      ruby = ["rubocop"];
      go = ["golangcilint"];
      java = ["checkstyle"];

      rust = ["clippy"];
      cpp = ["cppcheck"];
      cmake = ["cmakelint"];
    };
  };
}
