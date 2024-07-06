{
  enable = true;
  beacon.enable = true;
  ui = {
    border = "rounded";
    codeAction = "💡";
  };
  hover = {
    openCmd = "!floorp"; # Choose your browser
    openLink = "gx";
  };
  diagnostic = {
    borderFollow = true;
    diagnosticOnlyCurrent = false;
    showCodeAction = true;
  };
  symbolInWinbar.enable = true; # Breadcrumbs
  rename = {
    autoSave = false;
    keys = {
      select = "x";
      exec = "<CR>";
      quit = "<Esc>";
    };
  };
  outline = {
    layout = "normal"; # normal or float
    autoClose = true;
    autoPreview = true;
    closeAfterJump = true;
    winPosition = "right"; # left or right
    keys = {
      jump = "e";
      quit = "q";
      toggleOrJump = "o";
    };
  };
  scrollPreview = {
    scrollUp = "<C-b>";
    scrollDown = "<C-f>";
  };
}
