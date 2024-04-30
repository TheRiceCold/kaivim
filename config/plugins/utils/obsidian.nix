{
  enable = true;
  settings = {
    workspaces = [
      {
        name = "notes";
        path = "~/repos/obsidian/notes";
      }
    ];
    new_notes_location = "current_dir";
    completion = {
      min_chars = 2;
      nvim_cmp = true;
    };
  };
}
