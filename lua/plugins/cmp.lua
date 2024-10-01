local cmp = require('cmp')

return cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<Up>'] = cmp.mapping.select_prev_item(),      -- Navigate up in the completion menu
		['<Down>'] = cmp.mapping.select_next_item(),    -- Navigate down in the completion menu
		['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Confirm the selected item with Enter
	}),
})
