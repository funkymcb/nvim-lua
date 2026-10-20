-- Close nvim-tree automatically when it's the only "real" window left.
-- Runs on QuitPre (i.e. only when Neovim is actually about to quit) instead
-- of BufEnter, so floating windows (Telescope, etc.) can never trigger it.
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local invalid_win = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufnr = vim.api.nvim_win_get_buf(w)
			if vim.bo[bufnr].filetype == "NvimTree" then
				table.insert(invalid_win, w)
			end
		end
		-- if there are more than 1 windows and all except nvim-tree are gone,
		-- quit the nvim-tree windows too so the quit actually goes through.
		if #invalid_win == #wins - 1 then
			for _, w in ipairs(invalid_win) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})
