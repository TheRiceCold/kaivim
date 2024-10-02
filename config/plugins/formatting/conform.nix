{ lib, pkgs, ... }:
{
  extraPackages = with pkgs; [ nixfmt-rfc-style ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = let
        prettier = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
      in {
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        python = [ "flake8" ];
        go = [ "goimports" "gofmt" "golines" ];

        rust = [ "rustfmt" ];
        c = [ "clang_format" ];
        cmake = [ "cmake_format" ];
        cpp = [ "clang_format" ];

        yaml = [ "yamlfmt" ];

        css = prettier;
        json = prettier;
        html = prettier;
        markdown = prettier;

        javascript = prettier;
        typescript= prettier;

        sh = [ "shfmt" ];

        "_" = [ "squeeze_blanks" "trim_whitespace" "trim_newlines" ];
      };

      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };

      formatters = {
        prettier = {
          command = "prettier";
          prepend_args = [ "-w" ];
        };
        prettierd = {
          command = "prettierd";
          prepend_args = [ "-w" ];
        };
        shellcheck.command = lib.getExe pkgs.shellcheck;
        shfmt.command = lib.getExe pkgs.shfmt;
        shellharden.command = lib.getExe pkgs.shellharden;
        squeeze_blanks.command = lib.getExe' pkgs.coreutils "cat";
      };
    };
  };
}
