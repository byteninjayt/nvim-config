# Neovim Configuration

This Neovim configuration uses Lua for setting up various key mappings and plugins, including Telescope and Harpoon. It enhances productivity with keybindings for file searching, buffer navigation, and more.

## Plugins Used

This setup requires the following plugins:

1. **[Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**
   - A powerful fuzzy finder plugin for searching files, buffers, text, and more.

2. **[Harpoon](https://github.com/ThePrimeagen/harpoon)**
   - A project management tool for quickly marking and navigating files.

3. **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**
   - For LSP (Language Server Protocol) configurations to provide autocompletion, diagnostics, and other language features.

## Key Mappings

- **Formatting:**
  - `<Leader>fm`: Format code using `LspZeroFormat` (LSP Formatting).

- **Buffer Navigation:**
  - `[`: Move to the previous buffer.
  - `]`: Move to the next buffer.

- **Telescope Integration:**
  - `F`: Open Telescope with `live_grep` to search text across files.
  - `H`: Find files in the current directory:
    - If the project is a Git repository, it uses `git_files`.
    - Otherwise, it falls back to `find_files`.
  - `T`: Open the main Telescope menu.

- **Core Functionality:**
  - `;`: Shortcut to enter command mode (`:`).

- **Harpoon Integration:**
  - `M`: Add the current file to Harpoon's marks.
  - `S`: Toggle Harpoon's quick menu for navigating marked files.

## Installation

1. **Install Packer** (if not installed):
   
   Packer is a Neovim plugin manager. You can install it by running the following command in your terminal:
   
   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim \
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim

