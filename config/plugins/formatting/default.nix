{
  imports = [ ./conform.nix ];
  plugins = {
    mini.modules = {
      align = { };
      indentscope = {
        symbol = "▏";
        options = { try_as_border = true; };
      };
    };
  };
}
