colors: get-mode-color: [
  {
    __unkeyed-1 = "mode";
    color.__raw = get-mode-color;
  }

  {
    icon = "";
    __unkeyed-1 = "branch";
    color = { fg = colors.violet; gui = "bold"; };
  }


  {
    mode = 2;
    __unkeyed-1 = "buffers";
    symbols = {
      modified = "";
      alternate_file = "";
    };
    buffers_color = {
      inactive.fg = colors.grey;
      active = {
        fg = colors.blue;
        gui = "bold";
      };
    };
  }
]
