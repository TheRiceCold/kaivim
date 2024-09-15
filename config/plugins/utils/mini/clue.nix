let # to see keymaps go to `config/keymaps.nix`
  c = keys: desc: { mode = ""; inherit keys desc; };
  cl = key: desc: (c "<leader>${key}" desc);
  clues = [
    (cl "g" "+Git")
    (cl "l" "+Lsp")
    (cl "f" "+Find")
    (cl "r" "+Rest")
    (cl "c" "+Comment")
    (cl "h" "+Harpoon")
    (cl "s" "+Silicon")
    (cl "t" "+Terminal")
    (cl "b" "+BufferLine")

    # Some extra stuff
    (cl "N" "+Nix")
    (cl "D" "+Docs")
    (cl "L" "+LaTeX")
    (cl "M" "+Markdown")

    (c "gD" "references")
    (c "gi" "implementation")
    (c "gd" "Go to definition")
  ];
in {
  inherit clues;

  triggers = let
    t = keys: { mode = ""; inherit keys; };
  in [
    (t "<leader>") (t "g") (t "z")
  ];
}
