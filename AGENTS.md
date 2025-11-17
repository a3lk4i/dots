# AGENTS.md - Dotfiles Repository Guide

## Overview
Personal dotfiles: Neovim (kickstart.nvim), WezTerm, Nushell, Git. Symlink-based deployment with environment-aware setup (personal/work, Linux/macOS).

## Build & Setup Commands
```bash
# Initial setup: env=personal brew bundle && make
# Install tools: brew bundle
# Create symlinks: env=personal make sync (idempotent, safe to re-run)
# Verify status: env=personal make verify
# Remove symlinks: env=personal make clean
# Show commands: env=personal make help
```

**No traditional tests** - this is declarative configuration. Test manually after changes.

## Code Style (EditorConfig enforced)

### General
- **Indentation**: 4 spaces (Lua), 2 spaces (shell/YAML), tabs (Makefile/Go)
- **Line length**: 100 chars max | **Encoding**: UTF-8, LF | **Final newline**: required

### Lua (Neovim)
- Use modern API: `vim.keymap.set()`, `vim.opt.*`, `vim.api.nvim_create_autocmd()`
- Always add `desc` field to keymaps for discoverability
- Naming: `snake_case` for functions/variables, `SCREAMING_SNAKE_CASE` for constants
- Error handling: `pcall()` for risky ops, provide fallbacks (`os.getenv("HOME") or "/home/default"`)
- Imports: `local module = require("module")` at top of file
- Structure: Plugins in `kickstart/plugins/`, custom overrides in `custom/plugins/`

### Nushell
- Use closures for logic: `let completer = {|spans| ... }`
- Naming: `snake_case` variables, `$env.VAR` for environment, `_completer` suffix for closures
- Patterns: `match $spans.0 { ... }`, prefer `where` filters, `do $in $args` to invoke

### WezTerm
- Use `wezterm.config_builder()`, `local act = wezterm.action`
- Platform checks: `wezterm.target_triple:find("linux")`, guard optional APIs with `if wezterm.gui then`
- Naming: `snake_case` functions, ternary-style: `is_linux() and val1 or val2`

### Git
- Environment-specific configs: `personal.gitconfig` / `work.gitconfig`
- Makefile symlinks correct file based on `${env}` variable

## Common Patterns
- **Add Neovim plugin**: Create `nvim/lua/kickstart/plugins/name.lua`, return spec with `config` or `opts`
- **Add keybinding**: Edit `nvim/lua/config/keymaps.lua`, use `vim.keymap.set(mode, lhs, rhs, { desc = "..." })`
- **Modify WezTerm theme**: Edit `wezterm/colors/`, adjust `scheme_for_appearance()` function
- **Add Nushell completion**: Edit `external_completer` in `nushell/config.nu`, add match case

## Safety Rules
- Always provide fallback values for environment variables
- Use platform checks before platform-specific code
- Comment non-obvious logic with "NOTE:", "TIP:", "IMPORTANT:" prefixes
- Test on both Linux/macOS when applicable
