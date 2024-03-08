all: clean sync

sync:
	mkdir -p ~/.config/alacritty

	[ -f ~/.config/alacritty/alacritty.toml ] || ln -s $(PWD)/alacritty.toml ~/.config/alacritty/alacritty.toml
	[ -f ~/.config/alacritty/color.toml] || ln -s $(PWD)/color.toml ~/.config/alacritty/color.toml
	[ -f ~/.zshrc ] || ln -s $(PWD)/.zshrc ~/.zshrc
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.agignore ] || ln -s $(PWD)/agignore ~/.agignore
	# [-f ~/.tmux.conf] || ln -s $(PWD)/tmuxconf ~/.tmux.conf
	[-f ~/.config/nvim ] || ln -s $(PWD)/lazyvim/nvim ~/.config/nvim

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.zshrc
	rm -f ~/.config/alacritty/alacritty.toml
	rm -f ~/.config/alacritty/color.toml
	rm -f ~/.tigrc
	rm -f ~/.gitconfig
	rm -f ~/.agignore
	rm -rf ~/.config/nvim

.PHONY: all clean sync 
