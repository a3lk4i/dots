# dots

Personal dotfiles for Neovim, WezTerm, Nushell, and Git configurations.

## Quick Start

### Personal (Linux)

```bash
env=personal brew bundle && make
```

### Work (macOS)

```bash
env=work brew bundle && make
```

## Available Commands

```bash
# Show all available commands
env=personal make help

# Create/update symlinks (safe to run multiple times)
env=personal make sync

# Check current symlink status
env=personal make verify

# Remove dotfiles symlinks
env=personal make clean
```

## What Gets Installed

- **Neovim** → `~/.config/nvim`
- **WezTerm** → `~/.config/wezterm`
- **Nushell** → `~/.config/nushell`
- **Git config** → `~/.gitconfig` (personal.gitconfig or work.gitconfig)
- **Tig** → `~/.tigrc`
- **Ag** → `~/.agignore`
- **OpenCode** → `~/.config/opencode/opencode.jsonc`

All configurations are symlinked, so changes to this repository immediately apply.
