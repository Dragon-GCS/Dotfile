# set envirnment variable
$ENV:XDG_CONFIG_HOME = "$HOME\.config"
$ENV:XDG_DATA_HOME = $HOME
Set-Alias vim nvim

# see also: https://github.com/starship/starship#starship#powershell
Invoke-Expression (&starship init powershell)

# set rustup autocompletion
Invoke-Expression (&rustup completions powershell | Out-String)

# add py to executable file
$ENV:PATHEXT += ";.PY"

# remove start alias
Remove-Item alias:start -Force
