{
  enable = true;
  settings = {
    workspaces = [
      {
        name = "notes";
        path = "~/Vault/notes";
      }
    ];
    new_notes_location = "current_dir";
    completion = {
      min_chars = 2;
      nvim_cmp = true;
    };
  };
}
