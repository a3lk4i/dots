all: clean sync

sync:
	mkdir -p ~/.config/nushell

	[ -f ~/.wezterm.lua ] || ln -s $(PWD)/wezterm.lua ~/.wezterm.lua
	[ -f ~/.config/nushell ] || ln -s $(PWD)/nushell/* ~/.config/nushell/
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.agignore ] || ln -s $(PWD)/agignore ~/.agignore
	[ -f ~/.config/nvim ] || ln -s $(PWD)/nvim ~/.config/nvim

clean:
	rm -f ~/.wezterm.lua
	rm -rf ~/.config/nushell
	rm -f ~/.tigrc
	rm -f ~/.gitconfig
	rm -f ~/.agignore
	rm -rf ~/.config/nvim

.PHONY: all clean sync 
