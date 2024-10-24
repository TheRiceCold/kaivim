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
    { type = "padding"; val = 2; }
    {
      type = "group";
      val = let
        cmd = arg: "function() vim.cmd[[${arg}]] end";
      in [
        {
          type = "button";
          val = "New file";
          opts.shortcut = "n";
          on_press.__raw = cmd "ene!";
        }
        {
          type = "button";
          opts.shortcut = "r";
          val = "Recently opened files";
          on_press.__raw = cmd "FzfLua oldfiles";
        }
        {
          type = "button";
          opts.shortcut = "p";
          val = "Open a project";
          on_press.__raw = cmd "FzfProjectile";
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
      opts = {
        hl = "Keyword";
        position = "center";
      };
      val = "~ What we do in life, echoes in eternity ~";
    }
  ];
}
