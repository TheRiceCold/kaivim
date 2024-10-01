colors: get-mode-color: [
  {
    color.__raw = get-mode-color;
    __unkeyed-1.__raw = ''function() return '█' end'';
    padding = { left = 0; right = 1; };
  }

  # NOTE: I use gitmux
  # {
  #   icon = "";
  #   __unkeyed-1 = "branch";
  #   color = { fg = colors.blue; gui = "bold"; };
  # }

  {
    mode = 2;
    __unkeyed-1 = "buffers";
    symbols = { modified = ""; alternate_file = ""; };
    buffers_color = {
      inactive.fg = colors.grey;
      active = { fg = colors.blue; gui = "bold"; };
    };
  }
]
