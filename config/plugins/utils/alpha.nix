let
  icons = import ../../icons.nix;
in {
  enable = true;
  # theme = "dashboard";
  layout = [
    { type = "padding"; val = 2; }
    {
      type = "text";
      val = [
        "██╗  ██╗ █████╗ ██╗██╗   ██╗██╗███╗   ███╗"
        "██║ ██╔╝██╔══██╗██║██║   ██║██║████╗ ████║"
        "█████╔╝ ███████║██║██║   ██║██║██╔████╔██║"
        "██╔═██╗ ██╔══██║██║╚██╗ ██╔╝██║██║╚██╔╝██║"
        "██║  ██╗██║  ██║██║ ╚████╔╝ ██║██║ ╚═╝ ██║"
        "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
      ];
      opts = { position = "center"; hl = "Type"; };
    }
    { type = "padding"; val = 2; }
    {
      type = "group";
      val = let
        cmd = arg: "function() vim.cmd[[${arg}]] end";
      in [
        {
          type = "button";
          opts.shortcut = "f";
          val = "${icons.ui.telescope} Find file";
          on_press.__raw = cmd "Telescope find_files";
        }
        {
          type = "button";
          opts.shortcut = "n";
          on_press.__raw = cmd "ene!";
          val = "${icons.ui.file} New file";
        }
        {
          type = "button";
          opts.shortcut = "q";
          on_press.__raw = cmd "quit";
          val = "${icons.ui.close} Quit";
        }
      ];
    }
    { type = "padding"; val = 2; }
    {
      type = "text";
      val = "Inspiring quote here.";
      opts = { position = "center"; hl = "Keyword"; };
    }
  ];
}
