#
# Bash aliases
#
# In order to install these aliases, run the following command:
# curl -L https://github.com/fdavidcl/bash-scripts/raw/master/install.sh | bash

# Prompt customization (http://bashrcgenerator.com/)
export PS1="\[\e[00;37m\]\u \[\e[0m\]\[\e[00;36m\][\W]\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"

# Set CPU governor (performance/ondemand/powersave...)
function setgov () {
    echo "$1" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
}

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
function pdfmd() {
pandoc --to latex --latex-engine pdflatex -o $1.pdf $1 --template /home/fdavidcl/R/x86_64-pc-linux-gnu-library/3.1/rmarkdown/rmd/latex/default.tex
# Option: --toc (table of contents)
}

function npdfmd() {
pandoc --to latex --latex-engine pdflatex -N -o $1.pdf $1 --template /home/fdavidcl/R/x86_64-pc-linux-gnu-library/3.1/rmarkdown/rmd/latex/default.tex
}

# Misc. utilities and shortcuts
alias c='banner "---" && clear'
alias d='ddg'
alias p='ping t.co'
alias t='touch'
alias wa='ddg -b wa'
alias hs='ghci'

# Git shortcuts
alias gitallsync='git commit -a && git pull && git push'
alias gitsync='git commit && git pull && git push'
alias gitmod='git config core.fileMode false'
alias pull='git pull'
alias commit='git commit'
alias push='git push'
alias gitssh='ssh-add ~/.ssh/github_rsa'

# Alias for fdavidcl/project.sh
alias project='~/Documentos/Scripts/project.sh'

# Executes mess with custom ROM path
alias mess='mess -rompath /media/datos/Downloads/mess/roms'

# Inverts display colors
alias neg='xcalib -i -a; echo "Recuerda desactivar f.lux"'

# Useful if GNOME Shell hangs: Change tty (Ctrl-Alt-F2) and use this
alias gnome-recover='gnome-shell -r -d :0.0'

# Shortcut to spdycat (curl-like utility for SPDY)
alias spdycat='/media/datos/Downloads/Linux/spdylay-1.3.1/src/spdycat'

# R, Renv utilities
export PATH="$HOME/.Renv/bin:$PATH"
eval "$(Renv init -)"

# Update this file from Github
function aliases-update() {
	curl -L https://github.com/fdavidcl/bash-scripts/raw/master/bash_aliases.sh > ~/.fdavidcl_bash_aliases
}
