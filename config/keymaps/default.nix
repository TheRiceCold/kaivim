let
  keymap = key: action: desc: {
    inherit key action;
    options.desc = desc;
    mode = "";
  };
in {
  imports = [ ./which-key ];

  config = {
    globals.mapleader = " ";
    keymaps = let
      toggle-term = key: mode: {
        inherit mode key;
        options.desc = "Toggle Terminal";
        action = "<cmd>Lspsaga term_toggle<cr>";
      };
    in [
      # {
      #   mode = "t";
      #   action = "";
      #   key = <esc>";
      # }

      (keymap "<S-u>" "<C-r>" "Redo")
      (keymap "L" "<cmd>BufferLineCycleNext<cr>" "Next buffer")
      (keymap "H" "<cmd>BufferLineCyclePrev<cr>" "Previous buffer")

      (toggle-term "<c-\\>" "n")
      (toggle-term "<c-\\>" "t")
    ];
  };
}
