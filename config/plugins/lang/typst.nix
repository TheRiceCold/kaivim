build: let
  typst-preview = build
    "chomosuke"
    "typst-preview.nvim"
    "2024-09-29"
    "0354cc1a7a5174a2e69cdc21c4db9a3ee18bb20a"
    "n0TfcXJLlRXdS6S9dwYHN688IipVSDLVXEqyYs+ROG8=";
in {
  extraPlugins = [ typst-preview ];
  extraConfigLua = ''
    require'typst-preview'.setup {

    }
  '';
}
