local M = {}

function M.load()
	vim.api.nvim_set_option("clipboard", "unnamed")


	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function()
			local params = vim.lsp.util.make_range_params()
			params.context = { only = { "source.organizeImports" } }
			-- buf_request_sync defaults to a 1000ms timeout. Depending on your
			-- machine and codebase, you may want longer. Add an additional
			-- argument after params if you find that you have to write the file
			-- twice for changes to be saved.
			-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
			local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
			for cid, res in pairs(result or {}) do
				for _, r in pairs(res.result or {}) do
					if r.edit then
						local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
						vim.lsp.util.apply_workspace_edit(r.edit, enc)
					end
				end
			end
			vim.lsp.buf.format({ async = false })
		end
	})

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function()
			vim.lsp.buf.format() -- Or use vim.lsp.buf.formatting() for older versions
		end,
	})

	vim.cmd('set cursorline')
	vim.cmd('syntax enable')
	vim.g.mapleader = ' '
	vim.opt.termguicolors = true
	vim.opt.number = true
	vim.opt.shiftwidth = 4
	vim.opt.tabstop = 4
	vim.opt.fillchars = { eob = ' ' }

	vim.cmd("colorscheme catppuccin")
end

return M
