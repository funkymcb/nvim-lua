# nvim-lua

My personal Neovim configuration, written in Lua and managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- **Neovim ≥ 0.11** (uses the native `vim.lsp.enable()` / `lsp/` LSP config; developed on 0.12)
- `git`, `make` and a C compiler (for lazy.nvim bootstrap, `telescope-fzf-native` and treesitter parsers)
- A [Nerd Font](https://www.nerdfonts.com/) for icons (`nvim-web-devicons`)
- A terminal with true-color support

### External tools

| Tool | Used by |
| --- | --- |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Telescope `live_grep` / `grep_string`, todo-comments |
| [lazygit](https://github.com/jesseduffield/lazygit) | `<leader>gs` |
| [jq](https://jqlang.github.io/jq/) | JSON formatting (conform + `<leader>fj`) |
| [lua-language-server](https://github.com/LuaLS/lua-language-server) | Lua LSP |
| [stylua](https://github.com/JohnnyMorganz/StyLua) | Lua formatting |
| [gofumpt](https://github.com/mvdan/gofumpt), [goimports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports) | Go formatting |
| [mdformat](https://github.com/hukkin/mdformat) | Markdown formatting |
| [terraform](https://www.terraform.io/) | Terraform formatting |
| [tflint](https://github.com/terraform-linters/tflint) | Terraform linting |
| [shellcheck](https://www.shellcheck.net/) | Shell linting |
| [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter) | Building parsers (nvim-treesitter `main` branch) |

On macOS most of these can be installed with Homebrew:

```sh
brew install neovim ripgrep lazygit jq lua-language-server stylua gofumpt \
  terraform tflint shellcheck tree-sitter-cli
go install golang.org/x/tools/cmd/goimports@latest
pipx install mdformat
```

`terraform-ls` and `yaml-language-server` are installed automatically through Mason. Treesitter parsers (bash, go, hcl, json, lua, markdown, query, terraform, vim, vimdoc, yaml) are installed on startup; this requires the `tree-sitter` CLI.

## Installation

```sh
# back up an existing config first
mv ~/.config/nvim ~/.config/nvim.bak

git clone git@github.com:funkymcb/nvim-lua.git ~/.config/nvim
nvim
```

lazy.nvim bootstraps itself on first start and installs all plugins at the versions pinned in `lazy-lock.json`. Run `:Lazy restore` to re-sync to the lockfile or `:Lazy update` to update plugins.

Persistent undo is written to `~/.vim/undodir`.

## Structure

```
.
├── init.lua              # entry point
├── lazy-lock.json        # pinned plugin versions
├── lsp/
│   └── lua_ls.lua        # native LSP config for lua-language-server
└── lua/
    ├── autocmds.lua      # autocommands (close nvim-tree on quit)
    ├── keymaps.lua       # general keymaps
    ├── options.lua       # editor options
    ├── config/
    │   └── lazy.lua      # lazy.nvim bootstrap + setup
    └── plugins/          # one file per plugin / plugin group
```

## Plugins

| Plugin | Purpose |
| --- | --- |
| [catppuccin](https://github.com/catppuccin/nvim) | Colorscheme (transparent background) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline with custom Catppuccin Mocha theme |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer (replaces netrw) |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) + fzf-native | Fuzzy finder |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`main`) | Highlighting + indentation (parsers auto-installed on startup) |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + sources, [lspkind](https://github.com/onsails/lspkind.nvim) | Completion (LSP, signature help, snippets, path, buffer, cmdline) |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) + [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | Snippet engine |
| [mason.nvim](https://github.com/mason-org/mason.nvim), [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim), [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server installation / configs |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format on save |
| [nvim-lint](https://codeberg.org/mfussenegger/nvim-lint) | Linting |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs + inline blame |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit integration |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides (grey gradient, highlighted scope) |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and search TODO/FIXME comments |

## Language support

| Language | LSP | Formatter | Linter |
| --- | --- | --- | --- |
| Lua | lua_ls | stylua | – |
| Go | – | gofumpt, goimports | – |
| Terraform | terraformls (Mason) | terraform fmt | tflint |
| Shell/Bash | – | – | shellcheck |
| JSON | – | jq | – |
| Markdown | – | mdformat | – |
| YAML | yamlls (Mason) | – | – |

Formatting runs on save (2s timeout) and falls back to the LSP formatter when no conform formatter is configured.

## Keymaps

Leader is `<Space>`.

### General

| Mode | Key | Action |
| --- | --- | --- |
| n | `<leader><leader>` | Clear search highlight |
| n | `j` / `k` | Move by display line |
| n | `G`, `n`, `N`, `<C-d>`, `<C-u>` | Same as default, but re-center the cursor |
| n | `<leader>h/j/k/l` | Move to window left/down/up/right |
| n | `<leader>w` / `<leader>W` | Write / write and quit |
| n | `<leader>q` / `<leader>Q` | Quit / quit all |
| n | `<leader>cdo` | Run macro `@a` on every quickfix entry and save |
| n | `<leader>cn` / `<leader>cp` | Next / previous quickfix entry |
| n | `<leader>fj` | Format the buffer as JSON with `jq` |
| v | `<C-y>` | Yank to system clipboard |
| v | `<leader>be` / `<leader>bd` | Base64 encode / decode selection |
| v | `J` / `K` | Move selected lines down / up |

### LSP / diagnostics

| Mode | Key | Action |
| --- | --- | --- |
| n | `<leader>d` | Hover documentation |
| n | `<leader>gd` | Go to definition |
| n | `<leader>ca` | Code action |
| n | `<leader>n` / `<leader>p` | Next / previous diagnostic |

### Telescope

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fs` | Grep string under cursor |
| `<leader>fd` | LSP document symbols |
| `<leader>ft` | Search TODO comments |

Inside the Telescope prompt: `<Tab>` opens in a horizontal split, `<C-s>` in a vertical split.

### File tree (nvim-tree)

| Key | Action |
| --- | --- |
| `<C-f>` | Toggle tree |
| `<C-e>` | Focus tree |

Inside the tree (in addition to the defaults): `i` horizontal split, `s` vertical split, `t` new tab, `z` collapse all, `<Tab>` cd into node, `<Esc>` go up to parent.

### Git

| Key | Action |
| --- | --- |
| `<leader>gs` | Open LazyGit |
| `<leader>gb` | Gitsigns blame |

Current-line blame is shown inline (right-aligned) by default.

### Completion (insert mode)

| Key | Action |
| --- | --- |
| `<Tab>` / `<S-Tab>` | Next / previous item |
| `<CR>` | Confirm (selects first item if none selected) |
| `<C-d>` / `<C-u>` | Scroll docs |
| `<Left>` | Abort |
| `<C-c>` | Close menu |
| `<C-f>` / `<C-b>` | Jump to next / previous snippet placeholder |

## Options highlights

- Relative line numbers, 4-space tabs, no wrap, `scrolloff=10`
- New splits open below / to the right
- No swap/backup files, persistent undo
- Search does not wrap around the end of the file
- Inline diagnostics (`virtual_text`)
- netrw is disabled in favor of nvim-tree
