all: clean sync

sync:
	mkdir -p ~/.config/nushell

	[ -f ~/.wezterm.lua ] || ln -s $(PWD)/wezterm.lua ~/.wezterm.lua
	[ -f ~/.config/nushell/env.nu ] || ln -s $(PWD)/env.nu ~/.config/nushell/env.nu
	[ -f ~/.config/nushell/config.nu ] || ln -s $(PWD)/config.nu ~/.config/nushell/config.nu
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.agignore ] || ln -s $(PWD)/agignore ~/.agignore
	[ -f ~/.config/nvim ] || ln -s $(PWD)/lazyvim/nvim ~/.config/nvim

clean:
	rm -f ~/.wezterm.lua
	rm -rf ~/.config/nushell/env.nu
	rm -rf ~/.config/nushell/config.nu
	rm -f ~/.tigrc
	rm -f ~/.gitconfig
	rm -f ~/.agignore
	rm -rf ~/.config/nvim

.PHONY: all clean sync 
