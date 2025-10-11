# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration optimized for **Laravel and Livewire development**, based on [LazyVim](https://github.com/LazyVim/LazyVim). It includes PHP tooling (PHPActor LSP, Pint formatter, PHPStan level 5), Blade template support, Emmet for HTML, and automatic session management.

## Architecture

### Bootstrap & Entry Point

- `init.lua`: Entry point that bootstraps the configuration by requiring `config.lazy`
- `lua/config/lazy.lua`: Core lazy.nvim setup that auto-installs the plugin manager and configures the plugin loading system

### Configuration Structure

The configuration follows LazyVim's standard structure:

1. **Core Configuration** (`lua/config/`):
   - `options.lua`: Neovim options (extends LazyVim defaults)
   - `keymaps.lua`: Custom keybindings (extends LazyVim defaults)
   - `autocmds.lua`: Auto-commands for event-driven behavior (extends LazyVim defaults)
   - `lazy.lua`: Plugin manager bootstrap and configuration

2. **Plugin Specifications** (`lua/plugins/`):
   - Organized by category for better maintainability:
     - `coding.lua`: Coding tools (completion, emmet, auto-tags, surround)
     - `editor.lua`: Editor enhancements (sessions, folding)
     - `laravel.lua`: Laravel/PHP specific tools (PHPActor, Pint, PHPStan, Blade)
     - `tools.lua`: Development tools (Mason, Telescope, Git)
     - `ui.lua`: UI enhancements (notifications, indent guides, file explorer)
   - Each file returns a table (or array of tables) with plugin specifications
   - Can add new plugins, disable LazyVim plugins, or override plugin configurations

### Plugin System

LazyVim uses a spec-based plugin system where:
- Plugins are defined as Lua tables with configuration options
- `opts` field merges with parent plugin specs (deep merge for tables, but overwrites arrays)
- `opts` as a function allows extending default config: `opts = function(_, opts) ... end`
- Plugins can be disabled with `enabled = false`
- Dependencies are automatically managed through the `dependencies` field

### Active LazyVim Extras

The following LazyVim extras are enabled (see `lazyvim.json`):
- `lazyvim.plugins.extras.lang.php`
- `lazyvim.plugins.extras.lang.tailwind`

## Laravel Development Features

### PHP Tooling
- **LSP**: PHPActor (configured for PHP and Blade files)
- **Formatter**: Pint (Laravel's opinionated PHP formatter)
- **Linter**: PHPStan level 5
- **Blade Formatter**: blade-formatter with `force-aligned-multiline` for attributes

### Laravel Plugin Features
- `:Laravel artisan` - Run artisan commands
- `:Laravel routes` - Browse application routes
- `:Laravel related` - Navigate to related files (controller ↔ view ↔ model)
- `<leader>la` - Quick access to artisan commands
- `<leader>lr` - Quick access to routes
- `<leader>lm` - Quick access to related files

### Auto-completion
- Emmet LSP enabled for HTML, CSS, JavaScript, TypeScript, and Blade files
- Auto-close tags for HTML/Blade
- Tab/Shift-Tab for completion navigation

### Session Management
- Sessions auto-save on directory basis
- Last session auto-loads when opening Neovim in the same directory
- Sessions stored in `~/.local/share/nvim/sessions/`

## Development Commands

### Code Formatting

Within Neovim:
- `<leader>cf` - Format current file (uses Pint for PHP, blade-formatter for Blade)
- Blade formatter uses `force-aligned-multiline` for multi-line attributes

```bash
# Format Lua files with stylua (configured in stylua.toml)
stylua .

# Manually run Pint (if needed outside Neovim)
./vendor/bin/pint

# Format Blade files
blade-formatter --write resources/views/**/*.blade.php --wrap-attributes force-aligned-multiline
```

### Linting

- PHPStan runs automatically on PHP files (level 5)
- View diagnostics with `<leader>xx` (Trouble) or `<leader>cd` (line diagnostics)

### Plugin Management

Within Neovim:
- `:Lazy` - Open lazy.nvim plugin manager UI
- `:Lazy sync` - Update and install plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy check` - Check for plugin updates

### LSP & Tools

Tools are automatically installed via Mason (`:Mason` to open UI):
- PHPActor, PHPStan, Pint, blade-formatter
- Emmet-ls, HTML/CSS/Tailwind LSP
- Stylua, shellcheck, shfmt

### Editor Settings

- **Tab width**: 4 spaces for all languages
- **Line numbers**: Relative line numbers enabled
- **Scrolling**: 8 lines padding above/below cursor

## Key Concepts

### Adding a New Plugin

Create a new file in `lua/plugins/` (e.g., `lua/plugins/myplugin.lua`):

```lua
return {
  "author/plugin-name",
  opts = {
    -- plugin options
  },
}
```

### Modifying LazyVim Defaults

To override a LazyVim plugin configuration, create a spec for the same plugin:

```lua
return {
  "plugin/name",
  opts = function(_, opts)
    -- Extend existing opts
    opts.new_option = "value"
  end,
}
```

### Disabling LazyVim Plugins

```lua
return {
  "plugin/name",
  enabled = false,
}
```

## File Locations

- Plugin lock file: `lazy-lock.json` (tracks exact plugin versions)
- LazyVim state: `lazyvim.json` (tracks extras, version, news)
- Neovim data directory: `~/.local/share/nvim/` (plugin installations, Mason tools)

## Useful Keymaps

### Window Navigation
- `<C-h/j/k/l>` - Navigate between windows
- `<C-Up/Down/Left/Right>` - Resize windows

### Editing
- `<A-j/k>` - Move line/selection up/down
- `</>` in visual mode - Indent and stay in visual mode
- `p` in visual mode - Paste without yanking replaced text

### Laravel (via laravel.nvim)
- `<leader>la` - Laravel artisan commands
- `<leader>lr` - Laravel routes
- `<leader>lm` - Related files (model/controller/view)

### File Navigation
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Buffers

## Important Notes

- Default LazyVim plugins are lazy-loaded; custom plugins load at startup (unless `lazy = true`)
- LSP servers defined in plugin specs are auto-installed by Mason and configured via lspconfig
- Keymaps and options files load automatically on the VeryLazy event
- Sessions are directory-specific and auto-restore on next Neovim launch in same directory
- Intelephense is disabled in favor of PHPActor for better Laravel support
