# Bash aliases installer

echo "Downloading and installing fdavidcl/bash-aliases to ~/.fdavidcl_bash_aliases"

curl -L https://github.com/fdavidcl/bash-scripts/raw/master/bash_aliases.sh > ~/.fdavidcl_bash_aliases
echo '[[ -f ~/.fdavidcl_bash_aliases ]] && . ~/.fdavidcl_bash_aliases' >> ~/.bashrc && echo "Done!"
