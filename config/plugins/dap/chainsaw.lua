require('chainsaw').setup {
	logStatements = {
		messageLog = {
			go = 'fmt.Println("%s")',
		},
		variableLog = {
			go = 'fmt.Println("%s %s:", %s)',
			nvim_lua = 'vim.notify("%s %s", vim.inspect(%s))',
		},
	},
}
