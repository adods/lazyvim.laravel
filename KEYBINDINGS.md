# Neovim Keybindings & Commands

This document lists all available keyboard shortcuts and commands in this Laravel-optimized Neovim configuration.

## General Editor

### Window Navigation
- `<C-h>` - Move to left window
- `<C-j>` - Move to lower window
- `<C-k>` - Move to upper window
- `<C-l>` - Move to right window

### Window Resizing
- `<C-Up>` - Decrease window height
- `<C-Down>` - Increase window height
- `<C-Left>` - Decrease window width
- `<C-Right>` - Increase window width

### Editing
- `<A-j>` - Move line down (normal mode)
- `<A-k>` - Move line up (normal mode)
- `<A-j>` - Move selection down (visual mode)
- `<A-k>` - Move selection up (visual mode)
- `p` - Paste without yanking (visual mode)
- `<` - Indent left and reselect (visual mode)
- `>` - Indent right and reselect (visual mode)

### Basic Commands
- `:w` - Save file
- `:q` - Quit
- `:wq` - Save and quit
- `<leader>w` - Save file (LazyVim default)
- `<leader>q` - Quit (LazyVim default)

## File Navigation (Telescope)

### Finding Files
- `<leader><space>` - Find files (includes gitignored files)
- `<leader>ff` - Find files (includes gitignored files)
- `<leader>fg` - Live grep (search in files, includes gitignored files)
- `<leader>fb` - List buffers
- `<leader>fr` - Recent files (LazyVim default)
- `<leader>fR` - Recent files (cwd) (LazyVim default)

**Note:** Find files and grep commands show all files including gitignored directories (packages, synapps) but exclude .git/, node_modules/, and .DS_Store.

### File Explorer (Neo-tree)
- `<leader>e` - Toggle file explorer
- `<leader>E` - Toggle file explorer (cwd)

**Note:** Neo-tree shows all files including gitignored directories (packages, synapps) but excludes .git/, node_modules/, and .DS_Store.

## Laravel Development

### Laravel Plugin Commands
- `<leader>la` - Laravel artisan commands
- `<leader>lr` - Laravel routes browser
- `<leader>lm` - Navigate to related files (model ↔ controller ↔ view)

### Laravel CLI Commands
- `:Laravel artisan` - Run artisan commands
- `:Laravel routes` - Browse application routes
- `:Laravel related` - Navigate to related files
- `:Sail` - Laravel Sail commands
- `:Composer` - Run Composer commands
- `:Npm` - Run npm commands
- `:Yarn` - Run yarn commands

## Code Editing & LSP

### LSP Actions
- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `gy` - Go to type definition
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>cr` - Rename symbol
- `<leader>cf` - Format document (uses Pint for PHP, blade-formatter for Blade)

### Diagnostics
- `<leader>cd` - Line diagnostics
- `<leader>xx` - Toggle Trouble (diagnostics panel)
- `<leader>xX` - Trouble workspace diagnostics
- `<leader>xL` - Trouble location list
- `<leader>xQ` - Trouble quickfix list
- `]d` - Next diagnostic
- `[d` - Previous diagnostic

### Completion (nvim-cmp)
- `<Tab>` - Next completion item
- `<S-Tab>` - Previous completion item
- `<C-Space>` - Trigger completion
- `<CR>` - Confirm completion

## Code Tools

### Surround (nvim-surround)
- `ys{motion}{char}` - Add surrounding
- `ds{char}` - Delete surrounding
- `cs{old}{new}` - Change surrounding

Examples:
- `ysiw"` - Surround word with quotes
- `ds"` - Delete surrounding quotes
- `cs"'` - Change double quotes to single quotes

### Comments
- `gcc` - Toggle line comment
- `gc{motion}` - Toggle comment (motion)
- `gbc` - Toggle block comment

## Git Integration (Gitsigns)

### Git Actions
- `<leader>gb` - Git blame line
- `<leader>gB` - Git blame file
- `<leader>gd` - Git diff
- `<leader>gs` - Git status (LazyVim default)
- `]h` - Next hunk
- `[h` - Previous hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hu` - Undo stage hunk
- `<leader>hp` - Preview hunk

### Git UI
- `<leader>gg` - LazyGit (LazyVim default)

## Search & Replace

### Search
- `/` - Search forward
- `?` - Search backward
- `n` - Next search result
- `N` - Previous search result
- `<leader>sh` - Search help
- `<leader>sk` - Search keymaps (LazyVim default)
- `<leader>sc` - Search commands (LazyVim default)

### Find and Replace
- `<leader>sr` - Search and replace (LazyVim default)

## Terminal

### Terminal Commands
- `<leader>ft` - Terminal (root dir) (LazyVim default)
- `<leader>fT` - Terminal (cwd) (LazyVim default)
- `<C-/>` - Toggle terminal (LazyVim default)

## Session Management (Auto-session)

Sessions are automatically saved and restored based on the current directory.

### Session Commands
- Sessions auto-save when exiting Neovim
- Sessions auto-load when opening Neovim in the same directory
- Session files stored in `~/.local/share/nvim/sessions/`

## Plugin Management (Lazy.nvim)

### Lazy Commands
- `:Lazy` - Open plugin manager UI
- `:Lazy sync` - Update and install plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy check` - Check for plugin updates
- `:Lazy update` - Update plugins
- `:Lazy restore` - Restore plugins from lockfile

## Tool Management (Mason)

### Mason Commands
- `:Mason` - Open Mason UI
- `:MasonInstall <package>` - Install package
- `:MasonUninstall <package>` - Uninstall package
- `:MasonUpdate` - Update all packages

## UI & Interface

### Folding (nvim-ufo)
- `za` - Toggle fold
- `zR` - Open all folds
- `zM` - Close all folds
- `zr` - Reduce fold level
- `zm` - Increase fold level

### Notifications (Noice)
- `<leader>sn` - Noice history (LazyVim default)
- `<leader>snl` - Noice last message (LazyVim default)

### Indent Guides
Indent guides are automatically visible in supported file types.

## Quick Reference

### Leader Key
The leader key is `<Space>` (space bar) by default in LazyVim.

### Common Patterns
- `<leader>f` - File/Find operations
- `<leader>g` - Git operations
- `<leader>s` - Search operations
- `<leader>c` - Code operations
- `<leader>x` - Diagnostics/Trouble
- `<leader>l` - Laravel operations
- `<leader>u` - UI toggles (LazyVim default)

### Help
- `:help <topic>` - Get help on any topic
- `<leader>?` - Search help (LazyVim default)
- `:WhichKey` - Show all keybindings
- `<leader>sk` - Search keymaps

## PHP/Laravel Specific

### Formatting
- Auto-format on save (if enabled)
- `<leader>cf` - Manual format using Pint (PHP) or blade-formatter (Blade)

### Linting
- PHPStan level 5 runs automatically
- Diagnostics appear inline and in Trouble panel

### Blade Templates
- Emmet expansion works in Blade files
- Auto-close tags enabled
- Blade syntax highlighting active

## Tips

1. **Which-Key**: Press `<leader>` and wait to see available keybindings
2. **Telescope**: Most find/search operations use Telescope fuzzy finder
3. **Sessions**: Work in project directories to benefit from auto-session restore
4. **Git Blame**: Current line blame is shown inline automatically
5. **Relative Numbers**: Line numbers are relative for easier motion commands
