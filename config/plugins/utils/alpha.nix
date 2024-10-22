{
  enable = true;
  # theme = "dashboard";
  layout = [
    {
      type = "padding";
      val = 2;
    }
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
      opts = {
        position = "center";
        hl = "Type";
      };
    }
    {
      type = "padding";
      val = 2;
    }
    {
      type = "group";
      val = let
        cmd = arg: "function() vim.cmd[[${arg}]] end";
      in [
        {
          val = "New file";
          on_press.__raw = cmd "ene!";
          opts.shortcut = "n";
          type = "button";
        }
        {
          val = "Recently opened files";
          on_press.__raw = cmd "Telescope oldfiles theme=ivy";
          opts.shortcut = "r";
          type = "button";
        }
        {
          val = "Find file";
          on_press.__raw = cmd "Telescope find_files theme=ivy";
          opts.shortcut = "f";
          type = "button";
        }
        {
          val = "Open a project";
          on_press.__raw = cmd "Telescope project";
          opts.shortcut = "p";
          type = "button";
        }
        {
          type = "button";
          opts.shortcut = "q";
          on_press.__raw = cmd "quit";
          val = "Quit";
        }
      ];
    }
    { type = "padding"; val = 2; }
    {
      type = "text";
      val = "What we do in life, echoes in eternity";
      opts = {
        position = "center";
        hl = "Keyword";
      };
    }
  ];
}
