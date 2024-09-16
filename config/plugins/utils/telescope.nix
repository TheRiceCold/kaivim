icons: {
  enable = true;
  settings = {
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
      mappings = let
        action = act: "require'telescope.actions'.${act}";
      in {
        i = {
          "<PageUp>".__raw = action "preview_scrolling_up";
          "<PageDown>".__raw = action "preview_scrolling_down";
        };
        n = {
          "<PageUp>".__raw = action "preview_scrolling_up";
          "<PageDown>".__raw = action "preview_scrolling_down";
        };
      };
      extensions = { };
    };
  };
}
