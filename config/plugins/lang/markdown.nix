pkgs: {
  extraPlugins = [ pkgs.vimPlugins.render-markdown-nvim ];

  extraConfigLua = ''
    require'render-markdown'.setup {
      heading = {
        icons = { '◉', '○', '✸', '✿', '◉', '○' },
      },
      pipe_table = {
        border = { '╭', '┬', '╮', '├', '┼', '┤', '╰', '┴', '╯', '│', '─' },
      },
      code = {
        left_pad = 2,
        right_pad = 2,
        width = 'block'
      },
    }
  '';

  plugins = {
    glow.enable = true;
    markdown-preview = {
      enable = true;
      settings = {
        auto_close = 0;
        browser = "firefox";
      };
    };
  };
}

