let
  icons = import ../icons.nix;
in {
  enable = true;
  defaults = {
    vimgrep_arguments = [
      "rg"
      "-L"
      "--color=never"
      "--no-heading"
      "--with-filename"
      "--line-number"
      "--column"
      "--smart-case"
    ];
    prompt_prefix = "${icons.ui.telescope} ";
    color_devicons = true;
    mappings = [ ];
  };
  extensions = {
    file_browser = {
      enable = true;
      hidden = true;
    };
  };
}
