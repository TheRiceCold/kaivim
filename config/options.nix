{
  # General
  undofile = true; # Enable persistent undo (see also `:h undodir`)
  backup = false; # Don't store backup while overwriting the file
  writebackup = false; # Don't store backup while overwriting the file
  mouse = "a"; # Enable mouse for all modes

  # Appearance
  breakindent = true; # Indent wrapped lines to match line start
  cursorline = false; # Highlight current line
  linebreak = true; # Wrap long lines at 'breakat' (if 'wrap' is set)
  number = true; # Show line numbers

  # Editing
  ignorecase = true; # ignore case when searching (use '\C' to force not doing that)
  incsearch = true; # Show search results while typing
  infercase = true; # Infer letter cases for a richer built-in keyword completion
  smartcase = true; # Don't ignore case when searching if pattern has upper case
  smartindent = true; # Make indenting smart

  hidden = true;
  title = true;
  tabstop = 2;
  scrolloff = 8;
  shiftwidth = 2;
  numberwidth = 4;
  showcmd = false;
  hlsearch = true;
  swapfile = false;
  expandtab = true;
  updatetime = 100;
  timeoutlen = 1000;
  sidescrolloff = 8;
  termguicolors = true;
  splitkeep = "screen";
  fileencoding = "utf-8";
  guifont = "monospace:h17";
  clipboard = "unnamedplus";

  # Org mode
  conceallevel = 2;
  concealcursor = "nc";
}
