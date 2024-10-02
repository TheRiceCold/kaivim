build: let
  gh-action = build
    "topaxi"
    "gh-actions.nvim"
    "2024-09-20"
    "37be09dfe57531ea8a30143097d7340137092145"
    "S00YM2ULmYiRzVhiGat1mySmYrja8O9E9lVDbUSb/rA=";
in {
  extraPlugins = [ gh-action ];

  extraConfigLua = ''
    require'gh-actions'.setup {
      icons = {
        workflow_dispatch = '⚡️',
        conclusion = {
          success = '✓',
          failure = 'X',
          startup_failure = 'X',
          cancelled = '⊘',
          skipped = '◌',
        },
        status = {
          unknown = '?',
          pending = '○',
          queued = '○',
          requested = '○',
          waiting = '○',
          in_progress = '●',
        },
      },
      highlights = {
        GhActionsRunIconSuccess = { link = 'LspDiagnosticsVirtualTextHint' },
        GhActionsRunIconFailure = { link = 'LspDiagnosticsVirtualTextError' },
        GhActionsRunIconStartup_failure = { link = 'LspDiagnosticsVirtualTextError' },
        GhActionsRunIconPending = { link = 'LspDiagnosticsVirtualTextWarning' },
        GhActionsRunIconRequested = { link = 'LspDiagnosticsVirtualTextWarning' },
        GhActionsRunIconWaiting = { link = 'LspDiagnosticsVirtualTextWarning' },
        GhActionsRunIconIn_progress = { link = 'LspDiagnosticsVirtualTextWarning' },
        GhActionsRunIconCancelled = { link = 'Comment' },
        GhActionsRunIconSkipped = { link = 'Comment' },
        GhActionsRunCancelled = { link = 'Comment' },
        GhActionsRunSkipped = { link = 'Comment' },
        GhActionsJobCancelled = { link = 'Comment' },
        GhActionsJobSkipped = { link = 'Comment' },
        GhActionsStepCancelled = { link = 'Comment' },
        GhActionsStepSkipped = { link = 'Comment' },
      },
      split = {
        size = 40,
        position = 'right',
      }
    }
  '';
}
