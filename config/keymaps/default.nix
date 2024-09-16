let
  keymap = key: action: desc: {
    inherit key action;
    options.desc = desc;
    mode = "";
  };

  set-cmd = bind: command: keymap "<leader>${bind}" "<cmd>${command}<cr>";
  current-path = "vim.bo.buftype ~= 'nofile' and vim.api.nvim_buf_get_name(0) or nil";
in {
  keymaps = let
    rest = bind: action: set-cmd bind "Rest ${action}";
    latex = bind: action: set-cmd bind "Vimtex${action}" action;
    silicon = bind: action: set-cmd bind ("lua require'nvim-silicon'.${action}()");

    git = import ./git.nix set-cmd;
    lsp = import ./lsp.nix set-cmd;
    find = import ./find.nix set-cmd;
    buffer = import ./buffer.nix set-cmd keymap;
  in [
    (keymap "<S-u>" "<C-r>" "Redo")

    (set-cmd "z" "ZenMode" "Zen mode")
    (set-cmd "B" "Block" "Toggle block")
    (set-cmd "n" "set nu!" "Toggle line numbers")
    (set-cmd "e" ("lua MiniFiles.open(${current-path})") "Explorer")

    # Markdown
    (set-cmd "mr" "RenderMarkdown toggle" "Toggle render")
    (set-cmd "mv" "MarkdownPreviewToggle" "Browser preview")

    # Rest
    (rest "rr" "run" "Run")
    (rest "rl" "last" "Run last")

    # Latex
    (latex "Lv" "View")
    (latex "Le" "Errors")
    (latex "Lr" "Reload")
    (latex "Lc" "Compile")

    # Silicon
    (silicon "ss" "file" "Save as file")
    (silicon "sc" "clip" "Copy to clipboard")
  ] ++ buffer ++ find ++ lsp ++ git;
}
