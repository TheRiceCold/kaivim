{
  enable = true;
  panel.enabled = false;
  suggestion = {
    autoTrigger = true;
    keymap = {
      accept = "<M-l>";
      next = "<M-]>";
      prev = "<M-[>";
      dismiss = "<C-]>";
    };
  };
  filetypes = {
    yaml = true;
    markdown = true;

    javascript = true;
    typescript = true;

    help = false;
    gitcommit = false;
    gitrebase = false;
    hgcommit = false;
    svn = false;
    cvs = false;
    "." = false;
  };
}
