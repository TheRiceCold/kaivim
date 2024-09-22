{
  enable = true;
  beacon.enable = true;
  ui.border = "rounded";
  implement.enable = true;
  lightbulb.enable = false;
  symbolInWinbar.enable = true; # Breadcrumbs
  codeAction.extendGitSigns = true;

  scrollPreview = {
    scrollUp = "<PageUp>";
    scrollDown = "<PageDown>";
  };

  hover = {
    openLink = "gx";
    openCmd = "!firefox";
  };

  diagnostic = {
    borderFollow = true;
    diagnosticOnlyCurrent = false;
    showCodeAction = true;
  };

  rename = {
    autoSave = false;
    keys = { exec = "<cr>"; quit = "<esc>"; };
  };

  outline = {
    layout = "float";
    autoClose = true;
    autoPreview = true;
    closeAfterJump = true;
    keys = {
      jump = "e";
      quit = "q";
      toggleOrJump = "o";
    };
  };
}
