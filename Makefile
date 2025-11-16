all: clean sync

sync:
	[ -f ~/.config/wezterm ] || ln -s $(PWD)/wezterm ~/.config/wezterm
	[ -f ~/.config/nushell ] || ln -s $(PWD)/nushell ~/.config/nushell
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/${env}.gitconfig ~/.gitconfig
	[ -f ~/.agignore ] || ln -s $(PWD)/agignore ~/.agignore
	[ -f ~/.config/nvim ] || ln -s $(PWD)/nvim ~/.config/nvim
	[ -f ~/.config/opencode/opencode.json ] || ln -s $(PWD)/opencode.jsonc ~/.config/opencode/opencode.jsonc

clean:
	rm -rf ~/.config/wezterm
	rm -rf ~/.config/nushell
	rm -f ~/.tigrc
	rm -f ~/.gitconfig
	rm -f ~/.agignore
	rm -rf ~/.config/nvim

.PHONY: all sync clean
