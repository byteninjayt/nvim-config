local M = {}

function M.setup()
	require('mason').setup({})
	require('mason-lspconfig').setup({
		-- Replace the language servers listed here
		-- with the ones you want to install
		ensure_installed = { 'lua_ls', 'rust_analyzer', 'gopls' },
		handlers = {
			function(server_name)
				require('lspconfig')[server_name].setup({})
			end,

		},
	})

	require('lspconfig').gopls.setup({
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true, -- Enable static analysis
				usePlaceholders = true, -- Add placeholders in function signatures
				completeUnimported = true, -- Complete unimported packages

			},
		},
		on_attach = function(client, bufnr)
			-- Enable formatting on save
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_clear_autocmds({ buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = true })
					end
				})
			end
		end,
	})
end

return M
