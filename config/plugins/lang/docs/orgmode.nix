{ pkgs, ... }: let
  roam-dir = "~/repos/org-roam";
  notes-dir = "~/repos/orgfiles/**/*";
  agenda-dir = "~/repos/orgfiles/agenda/**/*";
in {
  plugins.orgmode = {
    enable = true;
    settings = {
      org_agenda_files = agenda-dir;
      org_default_notes_files = notes-dir;
      org_startup_folded = "showeverything";

      # Todo Options
      org_todo_keywords = [
        "NEXT(n)"
        "TODO(t)"
        "WAITING(w)"
        "SOMEDAY(s)"
        "PROJ(p)"
        "|"
        "DONE(d)"
        "CANCELLED(c)"
      ];
      org_todo_keywords_faces = let
        set = bg: fg: ":background ${bg} :foreground ${fg} :weight bold";
      in {
        NEXT = set "#5ea1ff" "#16181a";
        TODO = set "#5ef1ff" "#16181a";
        PROJ = set "#ffffff" "#16181a";
        WAITING = set "#faff5e" "#16181a";
        SOMEDAY = set "#ffbd5e" "#16181a";
        DONE = set "#5eff6c" "#16181a";
        CANCELLED = set "#ff6e5e" "#16181a";
      };

      mappings = {
        org = {
          org_todo = "<s-t>";
          org_schedule = "<c-s>";
          org_deadline = "<c-d>";
        };
        agenda = {
          org_agenda_later = ">";
          org_agenda_earlier = "<";
          org_agenda_goto_today = ".";
          org_agenda_show_help = "?";
        };
        org_agenda = "<Leader>oa";
        org_capture = "<Leader>oc";
      };
    };
  };

  extraPlugins = let
    builds = import ../../builds.nix pkgs;
  in
    with builds; [org-roam org-bullets];

  extraConfigLua =
    /*
    lua
    */
    ''
      require'org-roam'.setup {
        directory = '${roam-dir}',
        bindings = {
          prefix = "<leader>or",
        },
      }

      require'org-bullets'.setup {

      }
    '';
}
