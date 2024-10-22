{ pkgs, ... }: {
  extraPackages = with pkgs; [ripgrep chafa];
  plugins.telescope = let
    theme = "ivy";
  in {
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
            "<c-k>".__raw = action "preview_scrolling_up";
            "<c-j>".__raw = action "preview_scrolling_down";
          };
          n = {
            "<c-k>".__raw = action "preview_scrolling_up";
            "<c-j>".__raw = action "preview_scrolling_down";
          };
        };
      };

      pickers = {
        git_files.theme = theme;
        live_grep.theme = theme;
        find_files.theme = theme;
        grep_string.theme = theme;
      };

      extensions = {
        project = {
          inherit theme;
          base_dirs = ["~/repos"];
        };
        fzf-native = {
          fuzzy = true;
          override_generic_sorter = true;
          override_file_sorter = true;
          case_mode = "smart_case";
        };
        media_files = {
          find_cmd = "rg";
          filetypes = ["png" "jpg" "jpeg" "svg" "pdf"];
        };
      };
    };
  };

  # Extensions
  extraPlugins = let
    builds = import ../builds.nix pkgs;
  in
    with builds;
    with pkgs.vimPlugins; [
      telescope-emoji
      telescope-glyph

      telescope-project-nvim
      telescope-media-files-nvim
      telescope-fzf-native-nvim
    ];

  extraConfigLua = ''
    local telescope = require'telescope'

    telescope.load_extension('emoji')
    telescope.load_extension('glyph')
    telescope.load_extension('project')
    telescope.load_extension('media_files')
  '';
}
