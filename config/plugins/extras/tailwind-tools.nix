build: let
  tailwind-tools = build
    "luckasRanarison"
    "tailwind-tools.nvim"
    "2024-09-03"
    "a67d4b20eff105fbc234eea227682d15999a7733"
    "M4t2JcM64F8rW8zOdDZAiBD/1fD3sQnbDNggXjd3Nz4=";
in {
  extraPlugins = [ tailwind-tools ];
  extraConfigLua = ''
    require'tailwind-tools'.setup {

    }
  '';
}
