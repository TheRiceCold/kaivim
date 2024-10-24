{
  imports = [./plugins ./colorschemes];

  config = {
    globals.mapleader = " ";
    opts = import ./options.nix;
    keymaps = import ./keymaps.nix;
    extraConfigLua = ''
      -- Disable netrw
      g.loaded_netrw = 1
      g.loaded_netrwPlugin = 1

      -- Hide line numbers in terminal mode
      vim.cmd [[ autocmd TermOpen * setlocal nonumber norelativenumber ]]

    '';
  };
}
