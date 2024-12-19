-- NOTE: requires nui.nvim, which is installed along with noice
require('pipeline').setup {
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
	},
}
