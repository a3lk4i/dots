$env.PATH = ( $env.PATH | split row (char esep)
  | append /opt/homebrew/bin
  | append /home/linuxbrew/.linuxbrew/bin/
  | append /usr/local/bin
  | append ($env.HOME | path join .local bin)
  | append ($env.HOME | path join go bin)
  | append ($env.HOME | path join projects flutter bin)
  | append ($env.HOME | path join .docker bin)
  | uniq # filter so the paths are unique
)

$env.GOPRIVATE = "github.expedia.biz"
