{
  imports = [ ./vimtex.nix ./flutter.nix ];

  plugins = {
    markdown-preview = {
      enable = true;
      settings = {
        auto_close = 0;
        browser = "firefox";
      };
    };
    typescript-tools = import ./typescript.nix;

    lint = {
      enable = true;
      lintersByFt = {
        nix = ["statix"];
        lua = ["selene"];
        python = ["flake8"];
        javascript = ["eslint_d"];
        javascriptreact = ["eslint_d"];
        typescript = ["eslint_d"];
        typescriptreact = ["eslint_d"];
        json = ["jsonlint"];
        java = ["checkstyle"];
      };
    };
  };
}
