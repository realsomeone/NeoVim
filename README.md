# Neovim Configuration

## Installation

To copy this configuration to your system:

1. **Backup existing config (optional):**

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Copy the configuration:**

   ```bash
   cp -r /Users/alexmorales/.config/nvim ~/.config/
   ```

3. **Install Neovim plugins:**
   - Start Neovim: `nvim`
   - Lazy.nvim will automatically install all plugins on first run
   - Wait for the installation to complete

4. **Restart Neovim:**
   - Exit and restart Neovim to load all plugins properly

## Key Mappings

- `jk` - Exit insert mode
- `<leader>tt` - Toggle transparency
- `<leader>sv` - Split window vertically
- `<leader>sh` - Split window horizontally

## Customization

The configuration is organized in the `lua/alex/` directory:

- `core/` - Basic Neovim settings and keymaps
- `plugins/` - Plugin configurations
- `plugins/lsp/` - Language server configurations

## Requirements

- Neovim 0.9+ with Lua support
