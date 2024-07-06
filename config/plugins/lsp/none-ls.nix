{
  enable = true;
  sources = {
    code_actions = {
      statix.enable = true;
      gitsigns.enable = true;
    };
    diagnostics = {
      statix.enable = true;
      checkstyle.enable = true;
    };
    # formatting.prettier = {
    #   enable = true;
    #   disableTsServerFormatter = true;
    #   withArgs = /* lua */ ''
    #     {
    #       extra_args = { "--no-semi", "--single-quote" },
    #     }
    #   '';
    # };
  };
}
