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

      buffers = num: let
        is-ten = if (num == 0) then toString 10 else toString num;
      in {
        key = "<M-${num}>";
        mode = ["n" "i" "v" "s" "t" "o"];
        options.desc = "Buffer ${is-ten}";
        action = "<cmd>LualineBuffersJump ${is-ten}<cr>";
      };

      trouble-lsp = key: action: keymap key "<cmd>Trouble lsp_${action}<cr>" action;
    in [
      (keymap "<S-u>" "<C-r>" "Redo")

      (trouble-lsp "gr" "definitions")
      (trouble-lsp "gr" "references")
      (trouble-lsp "gi" "implementations")
      (keymap "K" "<cmd>Lspsaga hover_doc<cr>" "Hover")

      (toggle-term "<c-\\>" "n")
      (toggle-term "<c-\\>" "t")
    ] ++ (map buffers [1 2 3 4 5 6 7 8 9 0]);
  };
}
