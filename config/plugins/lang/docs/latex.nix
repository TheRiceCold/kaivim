{ pkgs, ... }: {
  extraPackages = with pkgs; [sioyek tectonic];

  plugins.vimtex.enable = true;

  extraConfigLua = ''
    vim.g['vimtex_view_method'] = 'sioyek'
    vim.g['vimtex_quickfix_mode'] = 0             -- suppress error reporting on save and build
    vim.g['vimtex_mappings_enabled'] = 0          -- Ignore mappings
    vim.g['vimtex_indent_enabled'] = 0            -- Auto Indent
    vim.g['tex_flavor'] = 'latex'                 -- how to read tex files
    vim.g['tex_indent_items'] = 0                 -- turn off enumerate indent
    vim.g['tex_indent_brace'] = 0                 -- turn off brace indent
    vim.g['vimtex_compiler_method'] = 'tectonic'
    vim.g['vimtex_log_ignore'] = ({               -- Error suppression:
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string',
    })
  '';
}
