{
  enable = true;
  ui.border = "rounded";
  scrollPreview = {
    scrollUp = "<C-k>";
    scrollDown = "<C-j>";
  };

  symbolInWinbar.enable = false; # breadcrumbs

  codeAction.extendGitSigns = true;

  implement.enable = false; # requires winbar enabled

  lightbulb.enable = false;

  outline.layout = "float";

  rename = {
    autoSave = false;
    keys = {
      exec = "<cr>";
      quit = "q";
    };
  };

  beacon.enable = false;
}
