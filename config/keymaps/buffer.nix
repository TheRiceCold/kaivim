set-cmd: keymap: let
  set = bind: action: set-cmd bind "BufferLine${action}";
in [
  # (set-cmd "bn" "enew" "New Buffer")
  (set-cmd "w" "w!" "Write buffer")
  (set-cmd "x" "clo" "Close split")
  (set-cmd "d" "update! | bdelete" "Delete buffer")

  (keymap "<S-h>" "<cmd>BufferLineCyclePrev<cr>" "Previous buffer")
  (keymap "<S-l>" "<cmd>BufferLineCycleNext<cr>" "Next buffer")

  (set "bp" "Pick" "Pick")
  (set "bc" "PickClose" "Pick close")
  (set "bn" "MoveNext" "Move next")
  (set "bb" "MovePrev" "Move previous")
  (set "bP" "TogglePin" "Toggle pin")
  (set "bo" "CloseOthers" "Close others")
]
