set-cmd: let
  set = bind: action: set-cmd bind "Telescope ${action} theme=ivy";
in [
  (set "ff" "fd" "File")
  (set "fe" "emoji" "Emoji")
  (set "fb" "buffers" "Buffer")
  (set "fk" "keymaps" "Keymap")
  (set "fj" "jumplist" "Jumplist")
  (set "ft" "todo-comments" "Todo")
  (set "fg" "live_grep" "Live Grep")
  (set "fs" "git_status" "Git Status")
  (set "fc" "colorscheme" "Colorscheme")
  (set "fa" "fd follow=true hidden=true" "File (including hidden)")

  (set-cmd "fr" "GrugFar" "Replace")
]
