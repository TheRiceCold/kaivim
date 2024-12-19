{ pkgs, ... }: {
  extraPackages = [pkgs.glslls];

  plugins.lsp = {
    enable = true;
    enabledServers = [];
    keymaps.lspBuf.gd = "definition";
    servers = {
      efm.enable = true;
      nil_ls.enable = true;
      bashls.enable = true;
      lua_ls.enable = true;
      typos_lsp.enable = true;

      # Web Dev
      html.enable = true;
      htmx.enable = true;
      ts_ls.enable = true;
      # volar.enable = true;
      cssls.enable = true;
      eslint.enable = true;
      emmet_ls.enable = true;
      tailwindcss.enable = true;

      taplo.enable = true;
      yamlls.enable = true;
      jsonls.enable = true;

      # Docs
      texlab.enable = true;
      marksman.enable = true;
      tinymist.enable = true;

      sqls.enable = true;
      graphql.enable = true;

      dockerls.enable = true;
      docker_compose_language_service.enable = true;

      gopls.enable = true;
      dartls.enable = true;
      vala_ls.enable = true;
      pylyzer.enable = true;
      solargraph.enable = true;
      java_language_server.enable = true;

      zls.enable = true;
      ccls.enable = true;
      cmake.enable = true;
      # clangd.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
    };
  };

  extraConfigLua = ''
    require'lspconfig'.glslls.setup{}
  '';
}
