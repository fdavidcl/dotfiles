#
# Bash aliases
#

# Prompt customization (http://bashrcgenerator.com/)
export PS1="\[\e[00;37m\]\u \[\e[0m\]\[\e[00;36m\][\W]\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"

### Battery related aliases
# Set CPU governor (performance/ondemand/powersave...)
# I use `pstate-frequency` now
function setgov () {
    echo "$1" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
}

function lm() {
    echo 5 | sudo tee /proc/sys/vm/laptop_mode
}

turbo() {
    local turbo="/sys/devices/system/cpu/intel_pstate/no_turbo"
    local cur=`cat $turbo`

    [[ cur -eq 1 ]] \
	&& echo "Activando Intel Turbo Boost" \
	&& sudo su -c "echo 0 > $turbo" \
	    || ( echo "Desactivando Intel Turbo Boost" \
		     && sudo su -c "echo 1 > $turbo"
        )
}

### Utilities
# Simple TODO function
function todo() {
    [[ $# -ge 1 ]] && (
        [[ $# -ge 2 ]] && (
            cp ~/.TODO ~/.TODO.old
            sed "$2d" ~/.TODO.old > ~/.TODO
        ) || (
            cp ~/.TODO ~/.TODO.new
            echo $1 >> ~/.TODO.new
            sort ~/.TODO.new > ~/.TODO
        )
    )

    nl ~/.TODO
}

# Pandoc functions
export PATH=$PATH:$HOME/.cabal/bin
function pdfmd() {
    pandoc --to latex --latex-engine pdflatex -o $1.pdf $1 --template /home/fdavidcl/R/x86_64-pc-linux-gnu-library/3.1/rmarkdown/rmd/latex/default.tex
    # Option: --toc (table of contents)
}

function npdfmd() {
    pandoc --to latex --latex-engine pdflatex -N -o $1.pdf $1 --template /home/fdavidcl/R/x86_64-pc-linux-gnu-library/3.1/rmarkdown/rmd/latex/default.tex
}

# needs micro editor:
export EDITOR=micro


# Misc. utilities and shortcuts
alias c='clear'
alias p='ping t.co'
alias hs='ghci'
alias ..='cd ..'
alias e=$EDITOR
alias g='git'
alias r='irb'
alias y='python'
alias m='make'
alias t='touch'
# pip install ddg to use these:
alias d='ddg'
alias wa='ddg -b wa'

# load virtualbox modules
alias vb='sudo modprobe vboxnetflt vboxpci vboxdrv vboxnetadp'

alias flux-start='systemctl --user start xfluxd'
alias flux-stop='systemctl --user stop xfluxd'

# copy the shrug emoticon to the clipboard (needs xclip)
alias shrug='echo -n "¯\_(ツ)_/¯" | xclip -selection clipboard'

# pip install thefuck to use this:
alias fuck='eval $(thefuck $(fc -ln -1))'

# Git shortcuts
# alias git='hub' # <-- needs hub
alias gitallsync='git commit -a && git pull && git push'
alias gitsync='git commit && git pull && git push'
alias gitmod='git config core.fileMode false'
alias pull='git pull'
alias commit='git commit'
alias push='git push'
alias gitssh='ssh-add ~/.ssh/id_rsa'

# Executes mess with custom ROM path
alias mess='mess -rompath /media/datos/Downloads/mess/roms'

# Inverts display colors
alias neg='xcalib -i -a; echo "Recuerda desactivar f.lux"'

# Launches nvidia-settings with correct parameters
alias nvidia-settings='optirun nvidia-settings -c :8'

# Useful if GNOME Shell hangs: Change tty (Ctrl-Alt-F2) and use this
alias gnome-recover='gnome-shell -r -d :0.0'

export TERM=xterm-256color

# needs z:
[[ -f ~/z.sh ]] && . ~/z.sh

function listenmic() {
    pactl load-module module-loopback latency_msec=1
}

function sonicpi() {
    jackd -R -d alsa -d hw:1&
    sonic-pi
}

alias latex='~/texliveonfly.py'

# needs oh-my-git:
source $HOME/.oh-my-git/prompt.sh


function monitors() {
    xrandr --output eDP1 --auto --output HDMI1 --auto --panning 3840x2160+3840+0 --scale 2x2 --left-of eDP1
}

# prevents errors on steam load
function steam() {
    LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1 /usr/$LIB/libgpg-error.so' steam
}

uptime
(which task >> /dev/null) && task next
