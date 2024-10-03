build: {
  extraPlugins = let
    table-nvim = build
      "SCJangra"
      "table-nvim"
      "2024-09-27"
      "c044fd37169eb10376962b0d0cec5f94d58ca626"
      "se5bgBCiOcDR8QseFHnVspw7ZGMAzvXYS6Sta/ci9vk=";
  in [table-nvim];

  plugins = {
    markdown-preview = {
      enable = true;
      settings = {
        auto_close = 0;
        browser = "firefox";
      };
    };
    render-markdown = {
      enable = true;
      settings = {
        pipe_table.border = ["╭" "┬" "╮" "├" "┼" "┤" "╰" "┴" "╯" "│" "─"];
      };
    };
  };
}
