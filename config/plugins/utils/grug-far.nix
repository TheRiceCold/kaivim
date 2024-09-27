# repo link https://github.com/MagicDuck/grug-far.nvim

build: let
  grug-far = build
    "MagicDuck"
    "grug-far.nvim"
    "2024-09-22"
    "27a502037da8657a8b2ab7e31a6439d7b7063af5"
    "IqNyZ4itwI6Qhv0ems+nm9iksbnJYAKR1JkJah2r5bc=";
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
