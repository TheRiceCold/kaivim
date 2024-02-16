# Nodule references: https://github.com/echasnovski/mini.nvim/blob/main/readmes
# NOTE: View keymaps at ../../keymaps.nix
{ icons, ... }: {
  enable = true;
  modules = {
    animate = { };

    basics = {
      options = { };
      mappings = { basic = true; windows = true; };
      autocommands = { basic = true; relnum_with_alt = true; };
    };

    clue = {
      clues = let
        c = keys: desc: { mode = ""; inherit keys desc; };
        cl = key: desc: (c "<leader>${key}" desc);
      in [
        (cl "g" "+Git")
        (cl "l" "+Lsp")
        (cl "f" "+Find")
        (cl "c" "+Comment")
        (cl "s" "+Silicon")
        (cl "t" "+Terminal")

        (c "gD" "references")
        (c "gi" "implementation")
        (c "gd" "Go to definition")
      ];

      triggers = let
        t = keys: { mode = ""; inherit keys; };
      in [
        (t "<leader>") (t "g") (t "z")
      ];
    };

    files = {
      mappings = { };
      windows.preview = true;
    };

    indentscope.symbol = icons.ui.line.left;

    jump2d = { view.dim = true; mappings.start_jumping = "f"; };

    move = {
      mappings = {
        left = "<S-,>";
        right = "<S-.>";
        # up = "<S-k>";
        # down = "<S-j>";

        line_left = "<S-,>";
        line_right = "<S-.>";
        # line_up = "<S-k>";
        # line_down = "<S-j>";
      };
    };

    splitjoin = { };
    starter = { };

    tabline = { };
    # test = { };
    trailspace = { };
  };
}
