{
  plugins.fzf-lua.enable = true;
  extraConfigLua = ''
    require'fzf-lua'.setup {
      winopts = { },
      fzf_opts = { ['--ansi'] = false },
      files = {
        git_icons = false,
        file_icons = false,
      },
    }
  '';
}
