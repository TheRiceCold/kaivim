# DOCS: https://github.com/echasnovski/mini.nvim/blob/main/readmes
icons: {
  enable = true;
  modules = {
    # animate = { };
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
        # NOTE: to see keymaps go to `config/keymaps.nix`
        (cl "g" "+Git")
        (cl "l" "+Lsp")
        (cl "f" "+Find")
        (cl "c" "+Comment")
        (cl "h" "+Harpoon")
        (cl "t" "+Terminal")
        (cl "b" "+BufferLine")

        # Some extra stuff
        (cl "N" "+Nix")
        (cl "D" "+Docs")
        (cl "L" "+LaTeX")
        (cl "S" "+Silicon")
        (cl "M" "+Markdown")

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
      content = { };
      mappings = { };
      windows.preview = true;
    };

    indentscope.symbol = icons.ui.line.left;
    jump2d = { view.dim = true; mappings.start_jumping = "f"; };

    move = { };

    pick = { };
    splitjoin = { };
    # starter = { silent = true; };
    # tabline = { };
    # test = { };
    trailspace = { };
  };
}
