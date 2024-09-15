build: let
  grug-far = build
    "MagicDuck"
    "grug-far.nvim"
    "2024-09-15"
    "907c3480a3392ec8a2db68cb2a4e59879379b464"
    "rVWQv8yDsJAIgzw8zN7v5dFK0LMHTtHn0nvfB4uHVX8=";
in {
  extraPlugins = [ grug-far ];
  extraConfigLua = ''
    require'grug-far'.setup {
      transient = true,
      keymaps = {
        help = { n = '?' },
        close = { n = 'q' },
      }
    }
  '';
}
