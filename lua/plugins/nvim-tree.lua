return {
	-- nvim-tree
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {
		actions = {
			open_file = {
				window_picker = {
					enable = false,
				},
			},
		},
		filters = {
			dotfiles = false, -- was hide_dotfiles = false
			git_ignored = false, -- was hide_gitignored = false
			custom = {}, -- was hide_hidden = false (no hidden files pattern)
		},
		update_focused_file = {
			enable = true, -- was follow_current_file.enabled = true
		},
		view = {
			width = 30, -- was window.width = 30
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return {
					desc = "nvim-tree: " .. desc,
					buffer = bufnr,
					noremap = true,
					silent = true,
					nowait = true,
				}
			end

			-- load all the defaults first (so you keep <CR>, o, etc.)
			api.config.mappings.default_on_attach(bufnr)

			-- your custom override: "i" opens a horizontal split
			vim.keymap.set("n", "i", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "z", api.tree.collapse_all, opts("Collapse All"))
			vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
			vim.keymap.set("n", "<Esc>", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "<Tab>", api.tree.change_root_to_node, opts("CD"))
		end,
	},
	keys = {
		{
			"<C-f>",
			"<cmd>NvimTreeToggle<cr>",
			desc = "NvimTree toggle",
		},
		{
			"<C-e>",
			"<cmd>NvimTreeFocus<cr>",
			desc = "NvimTree focus",
		},
	},
}
