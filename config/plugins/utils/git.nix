{
  plugins = {
    lazygit.enable = true;
    fugitive.enable = true;
    # diffview.enable = true;
    gitmessenger = {
      enable = true;
      includeDiff = "current";
      noDefaultMappings = true;
    };
    gitsigns = {
      enable = true;
      settings = {
        numhl = true;
        current_line_blame = true;
        signs = {
          add.text = "▎";
          change.text = "▎";
          delete.text = "";
          topdelete.text = "";
          changedelete.text = "▎";
          untracked.text = "▎";
        };
        signs_staged = {
          add.text = "▎";
          change.text = "▎";
          delete.text = "";
          topdelete.text = "";
          changedelete.text = "▎";
        };
      };
    };
  };
}
