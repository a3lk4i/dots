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

$env.GOPRIVATE = "github.expedia.biz"
$env.JAVA_HOME = ($env.HOME | path join Applications android-studio jbr)
