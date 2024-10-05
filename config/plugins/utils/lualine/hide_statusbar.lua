vim.api.nvim_create_autocmd('WinEnter', {
	once = true,
	command = [[set laststatus=0]],
})
