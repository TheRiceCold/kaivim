colors: get-mode-color: [
  {
    color.__raw = get-mode-color;
    __unkeyed-1.__raw = ''function() return '█' end'';
    padding = { left = 0; right = 1; };
  }
  {
    icon = "";
    __unkeyed-1 = "branch";
    color = { fg = colors.blue; gui = "bold"; };
  }
  {
    __unkeyed-1 = "diff";
    symbols = { added = " "; modified = "󰝤 "; removed = " "; };
    diff_color = {
      added.fg = colors.green;
      removed.fg = colors.red;
      modified.fg = colors.orange;
    };
  }

  { __unkeyed-1 = "%="; }
  {
    path = 1;
    shorting_target = 40;
    color.fg = colors.grey;
    __unkeyed-1 = "filename";
  }
]
