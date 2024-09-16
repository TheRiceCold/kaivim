{
  plugins = {
    lazygit.enable = true;
    fugitive.enable = true;
    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add.text = "▎";
          change.text = "▎";
          delete.text = "";
          topdelete.text = "";
          changedelete.text = "▎";
          untracked.text = "▎";
        };
        num_hl = true;
        current_line_blame = true;
      };
    };
  };
}
