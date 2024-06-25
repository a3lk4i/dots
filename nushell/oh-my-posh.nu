$env.config = ($env.config | upsert render_right_prompt_on_last_line true)

$env.POWERLINE_COMMAND = 'oh-my-posh'
$env.POSH_THEME = "~/.config/nushell/theme.omp.yaml"
$env.PROMPT_INDICATOR = $"(ansi y)$> (ansi reset)"

def posh_cmd_duration [] {
    # We have to do this because the initial value of `$env.CMD_DURATION_MS` is always `0823`,
    # which is an official setting.
    # See https://github.com/nushell/nushell/discussions/6402#discussioncomment-3466687.
    if $env.CMD_DURATION_MS == "0823" { 0 } else { $env.CMD_DURATION_MS }
}

def posh_width [] {
    (term size).columns | into string
}

# PROMPTS
$env.PROMPT_COMMAND = { ||
    ^"oh-my-posh" print primary $"--config=($env.POSH_THEME)" --shell=nu $"--execution-time=(posh_cmd_duration)" $"--status=($env.LAST_EXIT_CODE)" $"--terminal-width=(posh_width)" 
}

$env.PROMPT_COMMAND_RIGHT = { ||
    ^"oh-my-posh" print right $"--config=($env.POSH_THEME)" --shell=nu $"--execution-time=(posh_cmd_duration)" $"--status=($env.LAST_EXIT_CODE)" $"--terminal-width=(posh_width)"
}

