{ pkgs, ... }: {
  extraPackages = [pkgs.glslls];

  plugins.lsp = {
    enable = true;
    enabledServers = [];
    keymaps.lspBuf.gd = "definition";
    servers = {
      efm.enable = true;
      nil-ls.enable = true;
      bashls.enable = true;
      lua-ls.enable = true;
      typos-lsp.enable = true;

      # Web Dev
      html.enable = true;
      htmx.enable = true;
      ts-ls.enable = true;
      # volar.enable = true;
      cssls.enable = true;
      eslint.enable = true;
      emmet-ls.enable = true;
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
      docker-compose-language-service.enable = true;

      gopls.enable = true;
      dartls.enable = true;
      vala-ls.enable = true;
      pylyzer.enable = true;
      solargraph.enable = true;
      java-language-server.enable = true;

      zls.enable = true;
      ccls.enable = true;
      cmake.enable = true;
      # clangd.enable = true;
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };

      # Godot
      gdscript.enable = true;
    };
  };

  extraConfigLua = ''
    require'lspconfig'.glslls.setup{}
  '';
}
