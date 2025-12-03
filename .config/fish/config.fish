if status is-interactive
end
set fish_greeting
starship init fish | source
set -x PATH ~/.local/bin/ $PATH
