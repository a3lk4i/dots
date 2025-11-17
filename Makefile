# Makefile for dotfiles management
# Usage: env=personal make  OR  env=work make

# Configuration
CONFIG_DIR := $(HOME)/.config
DOTFILES_DIR := $(PWD)

# Validate environment variable
ifndef env
$(error env variable not set. Use: env=personal make OR env=work make)
endif

# Ensure env is valid
ifneq ($(env),personal)
ifneq ($(env),work)
$(error env must be 'personal' or 'work', got: $(env))
endif
endif

.PHONY: all sync clean help verify uninstall

# Default target
all: sync

# Help target
help:
	@echo "Dotfiles management commands:"
	@echo "  make sync          - Create symlinks (idempotent)"
	@echo "  make clean         - Remove symlinks only (safe)"
	@echo "  make uninstall     - Remove all dotfiles symlinks"
	@echo "  make verify        - Check symlink status"
	@echo ""
	@echo "Usage: env=personal make [target]"
	@echo "       env=work make [target]"

# Create all symlinks (idempotent - can run multiple times safely)
sync:
	@echo "Setting up dotfiles for environment: $(env)"
	@mkdir -p $(CONFIG_DIR)/opencode
	@ln -sfn $(DOTFILES_DIR)/wezterm $(CONFIG_DIR)/wezterm
	@ln -sfn $(DOTFILES_DIR)/nushell $(CONFIG_DIR)/nushell
	@ln -sfn $(DOTFILES_DIR)/nvim $(CONFIG_DIR)/nvim
	@ln -sfn $(DOTFILES_DIR)/tigrc $(HOME)/.tigrc
	@ln -sfn $(DOTFILES_DIR)/$(env).gitconfig $(HOME)/.gitconfig
	@ln -sfn $(DOTFILES_DIR)/agignore $(HOME)/.agignore
	@ln -sfn $(DOTFILES_DIR)/opencode.jsonc $(CONFIG_DIR)/opencode/opencode.jsonc
	@echo "✓ Symlinks created successfully"

# Verify current symlink status
verify:
	@echo "Checking dotfiles symlinks..."
	@echo -n "wezterm:  " && ([ -L $(CONFIG_DIR)/wezterm ] && echo "✓ linked" || echo "✗ missing")
	@echo -n "nushell:  " && ([ -L $(CONFIG_DIR)/nushell ] && echo "✓ linked" || echo "✗ missing")
	@echo -n "nvim:     " && ([ -L $(CONFIG_DIR)/nvim ] && echo "✓ linked" || echo "✗ missing")
	@echo -n "tigrc:    " && ([ -L $(HOME)/.tigrc ] && echo "✓ linked" || echo "✗ missing")
	@echo -n "gitconfig:" && ([ -L $(HOME)/.gitconfig ] && echo "✓ linked" || echo "✗ missing")
	@echo -n "agignore: " && ([ -L $(HOME)/.agignore ] && echo "✓ linked" || echo "✗ missing")
	@echo -n "opencode: " && ([ -L $(CONFIG_DIR)/opencode/opencode.jsonc ] && echo "✓ linked" || echo "✗ missing")

# Remove only symlinks that point to this dotfiles directory (safe)
clean:
	@echo "Removing dotfiles symlinks..."
	@[ -L $(CONFIG_DIR)/wezterm ] && readlink $(CONFIG_DIR)/wezterm | grep -q "$(DOTFILES_DIR)" && rm -f $(CONFIG_DIR)/wezterm || true
	@[ -L $(CONFIG_DIR)/nushell ] && readlink $(CONFIG_DIR)/nushell | grep -q "$(DOTFILES_DIR)" && rm -f $(CONFIG_DIR)/nushell || true
	@[ -L $(CONFIG_DIR)/nvim ] && readlink $(CONFIG_DIR)/nvim | grep -q "$(DOTFILES_DIR)" && rm -f $(CONFIG_DIR)/nvim || true
	@[ -L $(HOME)/.tigrc ] && readlink $(HOME)/.tigrc | grep -q "$(DOTFILES_DIR)" && rm -f $(HOME)/.tigrc || true
	@[ -L $(HOME)/.gitconfig ] && readlink $(HOME)/.gitconfig | grep -q "$(DOTFILES_DIR)" && rm -f $(HOME)/.gitconfig || true
	@[ -L $(HOME)/.agignore ] && readlink $(HOME)/.agignore | grep -q "$(DOTFILES_DIR)" && rm -f $(HOME)/.agignore || true
	@[ -L $(CONFIG_DIR)/opencode/opencode.jsonc ] && readlink $(CONFIG_DIR)/opencode/opencode.jsonc | grep -q "$(DOTFILES_DIR)" && rm -f $(CONFIG_DIR)/opencode/opencode.jsonc || true
	@echo "✓ Cleanup complete"

# Force remove all symlinks (use with caution)
uninstall: clean
	@echo "Dotfiles uninstalled"
