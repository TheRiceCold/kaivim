let # to see keymaps go to `config/keymaps.nix`
  clue = key: desc: {
    mode = "";
    keys = "<leader>${key}";
    inherit desc;
  };
in {
  clues = [
    (clue "g" "+Git")
    (clue "h" "+Git Hunk")

    (clue "l" "+Lsp")
    (clue "f" "+Find")
    (clue "r" "+Rest")
    (clue "L" "+LaTeX")
    # (clue "h" "+Harpoon")
    (clue "s" "+Silicon")
    (clue "m" "+Markdown")
    (clue "b" "+BufferLine")
  ];

  triggers = let
    t = keys: { mode = ""; inherit keys; };
  in [
    (t "<leader>") (t "g") (t "z")
  ];
}
