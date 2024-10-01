build: let
  grug-far = build
    "MagicDuck"
    "grug-far.nvim"
    "2024-09-30"
    "b7c2b28e49d55ff71cd9bb3ad19a2021316510d8"
    "qDbRn6abSbQDz6en9aC7dNZSUbeag6HrPwAW4oL6uzM=";
in {
  extraPlugins = [ grug-far ];
  extraConfigLua = ''
    require'grug-far'.setup {

    }
  '';
}