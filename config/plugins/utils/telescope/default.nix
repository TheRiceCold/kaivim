build:
{
  imports = [ (import ./emoji.nix build) ];

  plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        color_devicons = true;
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
        prompt_prefix = " ";
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
  };
}
