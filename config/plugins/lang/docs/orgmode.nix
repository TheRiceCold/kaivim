pkgs: build: let
  roam-dir = "~/Documents/org-roam";
  notes-dir = "~/Documents/orgfiles/**/*";
  agenda-dir = "~/Documents/orgfiles/agenda/**/*";
in {
  plugins.orgmode = {
    enable = true;
    settings = {
      org_agenda_files = agenda-dir;
      org_default_notes_files = notes-dir;
      org_startup_folded = "showeverything";
      mappings = {
        org_agenda = "<Leader>Oa";
        org_capture = "<Leader>Oc";
      };
    };
  };

  extraPlugins = let
    # Link: https://github.com/chipsenkbeil/org-roam.nvim
    org-roam = build
      "chipsenkbeil"
      "org-roam.nvim"
      "2024-09-24"
      "17f85abf207ece51bd37c8f3490d8f7d2fa106d0"
      "gONxa/CUXPgV+ucC+WkEyeH/lFAiTaQx8bEBq7g6HyY=";
    # Link: https://github.com/nvim-orgmode/org-bullets.nvim
    org-bullets = build
      "nvim-orgmode"
      "org-bullets.nvim"
      "2024-09-02"
      "46ae687e22192fb806b5977d664ec98af9cf74f6"
      "cRcO0TDY0v9c/H5vQ1v96WiEkIhJDZkPcw+P58XNL9w=";
  in [org-roam org-bullets];

  extraConfigLua = /*lua*/ ''
    require'org-roam'.setup {
      directory = '${roam-dir}',
    }

    require'org-bullets'.setup {

    }
  '';
}
