$env.config.show_banner = false

alias k = kubectl
alias oc = opencode
alias v = nvim

source ~/.config/nushell/starship.nu
source ~/.config/nushell/zoxide.nu
source $"($nu.cache-dir)/carapace.nu"
