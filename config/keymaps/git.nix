set-cmd: let
  signs = bind: action: set-cmd bind "Gitsigns ${action}";
  hunk = bind: action: signs "h${bind}" "${action}_hunk";
in [
  (set-cmd "gg" "LazyGit" "LazyGit")
  (signs "gt" "toggle_signs" "Toggle signs")
  (signs "gn" "toggle_numhl" "Toggle numhl")
  (signs "gl" "toggle_linehl" "Toggle linehl")
  (signs "gs" "stage_buffer" "Stage buffer")
  (signs "gR" "reset_buffer" "Reset buffer")
  (signs "gd" "toggle_deleted" "Toggle deleted")

  (hunk "n" "next" "Next")
  (hunk "p" "prev" "Previous")
  (hunk "s" "stage" "Stage")
  (hunk "r" "reset" "Reset")
  (hunk "v" "preview" "Preview")
  (hunk "u" "undo_stage" "Undo stage")
]
