local M = {}


local function is_file_readable(path)
	local stat = vim.loop.fs_stat(path)
	return stat and stat.type == 'file'
end

local function findFiles()
	if is_file_readable('.git/HEAD') then
		vim.cmd('Telescope git_files')
	else
		vim.cmd('Telescope find_files')
	end
end

function M.load()
	vim.api.nvim_set_keymap('n', '<Leader>fm', ':LspZeroFormat<cr>', { noremap = true })
	vim.api.nvim_set_keymap('n', '[', ':bprev<cr>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', ']', ':bnext<cr>', { noremap = true, silent = true })
	-- Telescope
	vim.api.nvim_set_keymap('n', 'F', ':Telescope live_grep<cr>', { noremap = true })
	vim.keymap.set('n', 'H', findFiles, { noremap = true })
	vim.api.nvim_set_keymap('n', 'T', ':Telescope<cr>', { noremap = true })

	-- Core Functionality
	vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = true })

	vim.keymap.set('n', 'M', function()
		require("harpoon.mark").add_file()
	end, { noremap = true })

	vim.keymap.set('n', 'S', function()
		require("harpoon.ui").toggle_quick_menu()
	end, { noremap = true })
end

return M
