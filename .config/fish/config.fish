if test (cat /etc/hostname) = "NB-00307"
  set -x USAGE_CONTEXT work
else
  set -x USAGE_CONTEXT personal
end

# Start X at login
if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    set -x SDL_VIDEODRIVER wayland
    set -x _JAVA_AWT_WM_NONREPARENTING 1
    set -x QT_QPA_PLATFORM wayland
    set -x XDG_CURRENT_DESKTOP sway
    set -x XDG_SESSION_DESKTOP sway
    exec sway &>> /tmp/sway.log || bash
  end
end

set -x KUBECONFIG (string join ':' ~/.kube/*.config)

set fish_greeting
fish_vi_key_bindings

source ~/backup/passwords/env.sh

alias cp "cp -i"
alias woman "man"
alias sudo "doas"
alias ledsOff "sudo sh -c 'ls /sys/class/leds/input*::*/brightness | xargs -I % sh -c \"echo 0 > %\"'"

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

