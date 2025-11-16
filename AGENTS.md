# AGENTS.md

## Repository Overview
Personal dotfiles repository managing configuration for:
- **Neovim**: Lua-based config with kickstart.nvim structure
- **WezTerm**: Terminal emulator with auto dark/light mode switching
- **Nushell**: Modern shell with custom completers and integrations
- **Git**: Separate configs for personal (Linux) and work (macOS) environments
- **Miscellaneous**: tigrc, agignore, EditorConfig

## Architecture

### Directory Structure
- `nvim/lua/config/`: Core Neovim settings (keymaps, options, autocmds)
- `nvim/lua/kickstart/plugins/`: Plugin configurations following kickstart.nvim pattern
- `nvim/lua/custom/plugins/`: Custom plugin overrides
- `wezterm/`: Terminal config with color schemes
- `nushell/`: Shell config, environment, theme integration (oh-my-posh, zoxide)

### Configuration Pattern
- Symlink-based deployment via Makefile
- Environment-aware setup (personal vs work) using `env` variable
- Platform-specific handling (Linux vs macOS) where needed

## Build/Setup Commands

### Initial Setup
```bash
# Personal (Linux)
env=personal brew bundle && make

# Work (macOS)
env=work brew bundle && make
```

### Common Operations
- **Install tools**: `brew bundle` (installs from Brewfile)
- **Symlink configs**: `make sync` (links dotfiles to ~/.config/)
- **Clean existing links**: `make clean` (removes symlinks)
- **Full setup**: `make` (cleans then syncs)

### No Traditional Tests
This is a dotfiles repository with declarative configurations. Testing is done through:
- Manual verification after changes
- EditorConfig validation for formatting
- Syntax checking via language servers (when available)

## Code Style Guidelines

### General Formatting
- **Indentation**: 4 spaces (default for Lua)
- **Shell scripts**: 2 spaces
- **Go/Makefile**: Tabs
- **YAML**: 2 spaces
- **Line length**: Max 100 characters
- **Encoding**: UTF-8 with LF line endings
- **Final newline**: Required (enforced by .editorconfig)

### Lua (Neovim Configuration)

#### Modern Neovim API Usage
- Use `vim.keymap.set()` for key mappings (not legacy `vim.api.nvim_set_keymap`)
- Always include descriptive `desc` field for discoverability via which-key
- Use `vim.opt.*` for setting options (not `vim.o`, `vim.wo`, `vim.bo` unless specific scope needed)
- Use `vim.api.nvim_create_autocmd()` for autocommands
- Group related autocommands with `vim.api.nvim_create_augroup(..., { clear = true })`

#### Code Organization
- Use local variables for module imports: `local wezterm = require("wezterm")`
- Group related requires at the top of file
- Extract repeated logic into local functions
- Keep plugin configs in separate files under `kickstart/plugins/`
- Custom overrides go in `custom/plugins/`

#### Naming Conventions
- **Local functions**: `snake_case` (e.g., `local function get_appearance()`)
- **Helper functions**: Can use `camelCase` for JavaScript-like patterns
- **Variables**: `snake_case` (e.g., `local home_path`)
- **Constants**: `SCREAMING_SNAKE_CASE` if truly constant

#### Error Handling
- Use `vim.notify(message, vim.log.levels.ERROR)` for user-facing errors
- Check for nil: `if value ~= nil then`
- Use `pcall()` for operations that might fail: `local ok, result = pcall(risky_function)`
- Provide fallback values: `os.getenv("HOME") or "/home/default"`

#### Comments
- Add explanatory comments for non-obvious logic
- Use full sentences with proper capitalization
- Include "NOTE:", "TIP:", "IMPORTANT:" prefixes for special attention
- Comment complex vim keybindings to explain behavior

#### Example Pattern
```lua
-- Load required modules
local builtin = require("telescope.builtin")

-- Helper function to check platform
local function is_linux()
    return vim.loop.os_uname().sysname == "Linux"
end

-- Configure with error handling
local ok, telescope = pcall(require, "telescope")
if not ok then
    vim.notify("Telescope not found", vim.log.levels.ERROR)
    return
end
```

### Nushell Configuration

#### Structure
- Closures for complex logic: `let completer = {|spans| ... }`
- Pipeline-based operations: use `|` for data flow
- Pattern matching: `match $spans.0 { ... }`

#### Naming
- **Variables**: `snake_case` (e.g., `$fish_completer`)
- **Environment variables**: Use `$env.VAR_NAME`
- **Closures**: Descriptive names ending in function-like suffixes (e.g., `_completer`)

#### Best Practices
- Use `default` for providing fallback values
- Prefer `where` filters over conditionals when filtering lists
- Use `do $in $args` to invoke closures
- Comment complex pipelines and matchers

### WezTerm Configuration

#### Structure
- Use `wezterm.config_builder()` for configuration
- Extract platform checks into local functions
- Handle optional APIs with guards: `if wezterm.gui then`

#### Naming
- **Functions**: `snake_case` (e.g., `scheme_for_appearance`)
- **Config variables**: descriptive names (e.g., `config.default_prog`)
- **Actions**: Use `act` alias for `wezterm.action`

#### Best Practices
- Check platform with `wezterm.target_triple:find("linux")`
- Provide fallbacks for environment variables
- Use ternary-style for platform-specific values: `is_linux() and value1 or value2`
- Comment UI customizations

### Git Configuration

#### Multi-Environment Pattern
- `personal.gitconfig`: Personal identity and settings
- `work.gitconfig`: Work identity and settings
- Makefile uses `${env}` variable to symlink correct config

#### Best Practices
- Keep sensitive info (email, name) in environment-specific files
- Share common aliases and settings through includes if needed

## Common Modification Patterns

### Adding a Neovim Plugin
1. Create new file in `nvim/lua/kickstart/plugins/plugin-name.lua`
2. Return plugin spec table with config function
3. Use `opts` for simple configuration, `config` for complex setup

### Adding a Keybinding
1. Edit `nvim/lua/config/keymaps.lua`
2. Use `vim.keymap.set(mode, lhs, rhs, { desc = "Description" })`
3. Group related keymaps together with comments

### Modifying WezTerm Appearance
1. Edit color scheme files in `wezterm/colors/`
2. Adjust `scheme_for_appearance()` function for auto-switching
3. Test on both light and dark system themes

### Customizing Nushell Completions
1. Edit completer closures in `nushell/config.nu`
2. Add match cases in `external_completer` for new commands
3. Test with Tab completion after reloading config

## Important Patterns to Maintain

### Consistency
- Follow existing code structure in each config type
- Match indentation and spacing of surrounding code
- Use same comment style as existing files

### Safety
- Always provide fallback values for environment variables
- Use platform checks before platform-specific code
- Test configs in both environments (Linux/macOS) when applicable

### Documentation
- Comment non-obvious configurations
- Explain "why" for unusual patterns or workarounds
- Link to relevant documentation for complex features
