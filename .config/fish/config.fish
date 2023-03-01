# Start X at login

if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx -- -keeptty
  end
end

set fish_greeting
fish_vi_key_bindings

alias cp "cp -i"
alias sudo "doas"
alias ledsOff "sudo sh -c 'ls /sys/class/leds/input*::*/brightness | xargs -I % sh -c \"echo 0 > %\"'"
alias tetrio "/home/not-a-robot/Downloads/tetrio/opt/TETR.IO/tetrio-desktop"

bind \cr "commandline (history | fzf; or echo '')"

function extract
  if [ -f $argv ]
    switch $argv
      case '*.tar.bz2'
        tar xjf $argv
      case '*.tar.gz'
        tar xzf $argv
      case '*.bz2'
        bunzip2 $argv
      case '*.rar'
        unrar x $argv
      case '*.gz'
        gunzip $argv
      case '*.tar'
        tar xf $argv
      case '*.tbz2'
        tar xjf $argv
      case '*.tgz'
        tar xzf $argv
      case '*.zip'
        unzip $argv
      case '*.Z'
        uncompress $argv
      case '*.7z'
        7z x $argv
      case '*'
        echo "Could not extract \"$argv\""
    end
  else
    echo "'$argv' is not a valid file"
  end
end

