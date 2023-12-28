return {
    -- neo-tree
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
    },
    config = function()
        -- keybindings
        vim.keymap.set("n", "<C-f>", ":Neotree toggle<CR>")

        -- config
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                },
                follow_current_file = {
                    enabled = true,
                },
            },
            window = {
                width = 30,
                mappings = {
                    ["i"] = "open_split",
                    -- prev sibbling
                    ["<"] = function(state)
                        local indexOf = function(array, value)
                            for i, v in ipairs(array) do
                                if v == value then
                                    return i
                                end
                            end
                            return nil
                        end
                        local tree = state.tree
                        local node = tree:get_node()
                        local parent = tree:get_node(node:get_parent_id())
                        local siblings = parent:get_child_ids()
                        local index = indexOf(siblings, node.id)
                        if index > 1 then
                            local nextIndex = siblings[index - 1]
                            local renderer = require("neo-tree.ui.renderer")
                            renderer.focus_node(state, nextIndex)
                        end
                    end,
                    -- next sibbling
                    [">"] = function(state)
                        local indexOf = function(array, value)
                            for i, v in ipairs(array) do
                                if v == value then
                                    return i
                                end
                            end
                            return nil
                        end
                        local tree = state.tree
                        local node = tree:get_node()
                        local parent = tree:get_node(node:get_parent_id())
                        local siblings = parent:get_child_ids()
                        if not node.is_last_child then
                            local index = indexOf(siblings, node.id)
                            local nextIndex = siblings[index + 1]
                            local renderer = require("neo-tree.ui.renderer")
                            renderer.focus_node(state, nextIndex)
                        end
                    end,
                },
            },
        })
    end,
}
