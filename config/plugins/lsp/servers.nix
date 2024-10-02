{
  bashls = {
    enable = true;
		cmd = [ "bash-language-server" "start" ];
  };
  lua-ls = {
    enable = true;
    settings.Lua = {
      hint.enable = true;
      runtime.version = "LuaJIT";
    };
  };
  ts-ls = {
    enable = true;
    cmd = [ "typescript-language-server" "--stdio" ];
    filetypes = [
			"javascript"
			"javascriptreact"
			"javascript.jsx"
			"typescript"
			"typescriptreact"
			"typescript.tsx"
    ];
  };
  eslint = {
    enable = true;
		cmd = [ "vscode-eslint-language-server" "--stdio" ];
    filetypes = [
			"javascript"
			"javascriptreact"
			"javascript.jsx"
			"typescript"
      "typescriptreact"
			"typescript.tsx"
			"vue"
			"svelte"
			"astro"
			"js"
    ];
  };
  tailwindcss = {
    enable = true;
    cmd = [ "tailwindcss-language-server" "--stdio" ];
  };
  efm.enable = true;
  sqls.enable = true;
  html.enable = true;
  htmx.enable = true;
  cssls.enable = true;
  astro.enable = true;
  gopls.enable = true;
  templ.enable = true;
  volar.enable = true;
  nil-ls.enable = true;
  clangd.enable = true;
  dartls.enable = true;
  jsonls.enable = true;
  graphql.enable = true;
  emmet-ls.enable = true;
  dockerls.enable = true;
  gdscript.enable = true;
  marksman.enable = true;
  texlab.enable = true;
  yamlls.enable = true;
  pyright.enable = true;
  solargraph.enable = true;
  java-language-server.enable = true;
  rust-analyzer = {
    enable = true;
    installCargo = true;
    installRustc = true;
  };
}
