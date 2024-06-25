$env.PATH = ( $env.PATH | split row (char esep)
  | append /opt/homebrew/bin
  | append ($env.HOME | path join .local bin)
  | uniq # filter so the paths are unique
)
