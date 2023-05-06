all: clean sync

sync:
	mkdir -p ~/.config/alacritty

	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.config/alacritty/color.yml ] || ln -s $(PWD)/color.yml ~/.config/alacritty/color.yml
	[ -f ~/.zshrc ] || ln -s $(PWD)/.zshrc ~/.zshrc
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.agignore ] || ln -s $(PWD)/agignore ~/.agignore
	# [ -f ~/.config/nvim ] || ln -s $(PWD)/nvim/lazyvim ~/.config/nvim
	[ -f ~/.config/nvim/lua/custom ] || ln -s $(PWD)/nvim/nvchad/custom ~/.config/nvim/lua/custom

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.zshrc
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.config/alacritty/color.yml
	rm -f ~/.tigrc
	rm -f ~/.gitconfig
	rm -f ~/.agignore
	# rm -rf ~/.config/nvim
	rm -rf ~/.config/nvim/lua/custom

.PHONY: all clean sync 
