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
# change cargo build_dir
$ENV:CARGO_TARGET_DIR = "D:\Projects\Rust\target_dir"

# remove start alias
Remove-Item alias:start -Force

# jupternootbook
function notebook {D:\Projects\Python\04_Deeplearning\.venv\Scripts\jupyter-notebook.exe}
$ENV:LANG='zh_CN.UTF8'
