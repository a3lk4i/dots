$env.PATH = ( $env.PATH | split row (char esep)
  | append ($env.HOME | path join .flutter-sdk flutter bin)
  | append ($env.HOME | path join .pub-cache bin)
  | append ($env.HOME | path join .docker bin)
  | append ($env.HOME | path join go bin)
  | append ($env.HOME | path join .local bin)
  | append /usr/local/bin
  | append /opt/homebrew/bin
  | append /home/linuxbrew/.linuxbrew/bin/
  | uniq # filter so the paths are unique
)

$env.JAVA_HOME = ($env.HOME | path join Applications android-studio jbr)

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"

