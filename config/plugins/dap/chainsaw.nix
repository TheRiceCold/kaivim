build: {
  extraPlugins = let
    # LINK: https://github.com/chrisgrieser/nvim-chainsaw
    chainsaw = build
      "chrisgrieser"
      "nvim-chainsaw"
      "2024-09-14"
      "80962ec2570813c94ebc3ab343ba3113409b7f43"
      "F0toWkteQWWhdq1mUyD0E5gKF5odFWBcvwWd3dTrw6c=";
  in [chainsaw];

  extraConfigLua = ''
    require'chainsaw'.setup {
      logStatements = {
        messageLog = {
          go = 'fmt.Println("%s")',
        },
        variableLog = {
          go = 'fmt.Println("%s %s:", %s)',
          nvim_lua = 'vim.notify("%s %s", vim.inspect(%s))',
        },
      }
    }
  '';
}
