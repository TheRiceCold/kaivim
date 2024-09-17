{
  enable = true;
  select = {
    enable = true;
    lookahead = true;
    keymaps = {
      "af" = "@function.outer";
      "if" = "@function.inner";
      "ac" = "@class.outer";
      "ic" = "@class.inner";
      "a," = "@parameter.outer";
      "i," = "@parameter.inner";
    };
  };
  move = {
    enable = true;
    setJumps = true;
    gotoNextStart = {
      "]f" = "@function.outer";
      "]c" = "@class.outer";
      "]," = "@parameter.inner";
    };
    gotoNextEnd = {
      "]F" = "@function.outer";
      "]C" = "@class.outer";
    };
    gotoPreviousStart = {
      "[f" = "@function.outer";
      "[c" = "@class.outer";
      "[," = "@parameter.inner";
    };
    gotoPreviousEnd = {
      "[F" = "@function.outer";
      "[C" = "@class.outer";
    };
  };
  swap = {
    enable = true;
    swapNext = { ">," = "@parameter.inner"; };
    swapPrevious = { "<," = "@parameter.inner"; };
  };
}
