{ lib, pkgs, ... }:
{
  extraPackages = with pkgs; [ alejandra black ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      notifyOnError = true;
      formatters_by_ft = let
        prettier = {
          __unkeyed-1 = "prettierd";
          stop_after_first = true;
        };
      in {
        sh = ["shfmt"];
        lua = ["stylua"];
        nix = ["alejandra"];

        html = prettier;
        css = prettier;
        javascript = prettier;
        typescript = prettier;

        sql = ["sqlfluff"];

        json = prettier;
        yaml = ["yamlfmt"];

        typst = ["typstyle"];

        go = ["goimports" "gofmt"];

        python = ["black"];

        java = ["google-java-format"];

        rust = ["rustfmt"];
        c = ["clang_format"];
        cmake = ["cmake_format"];
        cpp = ["clang_format"];

        "_" = ["squeeze_blanks" "trim_whitespace" "trim_newlines"];
      };

      formatters = {
        prettier = {
          command = "prettier";
          prepend_args = ["-w"];
        };
        prettierd = {
          command = "prettierd";
          prepend_args = ["-w"];
        };
        shellcheck.command = lib.getExe pkgs.shellcheck;
        shfmt.command = lib.getExe pkgs.shfmt;
        shellharden.command = lib.getExe pkgs.shellharden;
        squeeze_blanks.command = lib.getExe' pkgs.coreutils "cat";
      };
    };
  };
}
