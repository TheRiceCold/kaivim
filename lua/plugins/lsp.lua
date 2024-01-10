return {
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = { 
					'lua_ls', 
					'rnix',
					'html',
					'tailwindcss',
					'graphql',
					'emmet_ls',
					'pyright',
					'tsserver',
				}
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			{ 'antosha417/nvim-lsp-file-operations', config = true }
		},

		config = function()
			local lspconfig = require('lspconfig')
			local cmp_nvim_lsp = require('cmp_nvim_lsp')

			local key = vim.keymap

			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr

				opts.desc = 'Show LSP references'
				key.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

				opts.desc = 'Go to declaration'
				key.set('n', 'gD', vim.lsp.buf.declaration, opts)

				opts.desc = 'Show LSP definitions'
				key.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

				opts.desc = 'Show LSP implementations'
				key.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

				opts.desc = 'Show LSP type definitions'
				key.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

				opts.desc = 'Show LSP type definitions'
				key.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

				opts.desc = 'Smart rename'
				key.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

				opts.desc = 'Show buffer diagnostics'
				key.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

				opts.desc = 'Show line diagnostics'
				key.set('n', '<leader>d', vim.diagnostics.open_float, opts)

				opts.desc = 'Go to previous diagnostic'
				key.set('n', '[d', vim.diagnostics.goto_prev, opts)

				opts.desc = 'Go to next diagnostic'
				key.set('n', ']d', vim.diagnostics.goto_next, opts)

				opts.desc = 'Show documentation for what is under cursor'
				key.set('n', 'K', vim.lsp.buf.hover, opts)

				opts.desc = 'Show documentation for what is under cursor'
				key.set('n', '<leader>rs', ':LspRestart<CR>', opts)
			end

			local capabilities = cmp_nvim_lsp.default_capabilities()
			local icons = require('../icons').diagnostics

			local signs = { 
				Hint = icons.Hint, 
				Info = icons.BoldInformation,  
				Warn = icons.BoldWarning, 
				Error = icons.BoldError, 
			}

			for type, icon in pairs(signs) do
				local hl = 'DiagnosticSign' .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
			end

			lspconfig['html'].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig['tsserver'].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig['tailwindcss'].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig['emmet_ls'].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' }
			})

			lspconfig['pyright'].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig['lua_ls'].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = { globals = { 'vim' } },
						workspaces = {
							library = {
								[vim.fn.expand('$VIMRUNTIME/lua')] = true,
								[vim.fn.stdpath('config') .. '/lua'] = true,
							},
						},
					},
				},
			})
		end,
	}
}
