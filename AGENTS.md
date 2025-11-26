## Overview
Personal dotfiles: Neovim (kickstart.nvim), WezTerm, Nushell, Opencode, Git. Symlink-based deployment.

## Commands
```bash
env=personal brew bundle && make  # Initial setup
env=personal make sync            # Create symlinks (idempotent)
env=personal make verify          # Check status
```
**No tests** - declarative config, test manually after changes.

## Code Style (EditorConfig enforced)
- **Indentation**: 4 spaces (Lua), 2 spaces (shell/YAML), tabs (Makefile/Go) | **Line length**: 100 chars
- **Lua**: `vim.keymap.set()` with `desc`, `snake_case`, `pcall()` for errors, `local m = require("m")` at top
- **Nushell**: closures `{|spans| ...}`, `$env.VAR`, `match` patterns
- **WezTerm**: `wezterm.config_builder()`, platform checks via `target_triple:find("linux")`

## Common Patterns
- **Add plugin**: `nvim/lua/kickstart/plugins/name.lua`, return spec with `config`/`opts`
- **Add keybind**: `nvim/lua/config/keymaps.lua`, use `vim.keymap.set(mode, lhs, rhs, { desc = "..." })`
- **Git config**: `personal.gitconfig`/`work.gitconfig` selected by `${env}` variable

## Safety
Always use fallbacks for env vars, platform checks before platform-specific code, comment with NOTE:/TIP:/IMPORTANT:
