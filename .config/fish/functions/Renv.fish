# Configuration file for Renv (R environment manager)
# Based on 'rvm.fish' for RVM

# Add 'Renv > /dev/null' to config.fish

function Renv --description='R environment'
  set --local env_file (mktemp -t rvm.fish.XXXXXXXXXX)
  bash -c 'PATH=$HOME/.Renv/bin:$PATH; eval "$(~/.Renv/bin/Renv init -)"; Renv "$@"; status=$?; env > "$0"; exit $status' $env_file $argv

  # apply rvm_* and *PATH variables from the captured environment
  and eval (grep '^Renv\|^[^=]*PATH' $env_file | grep -v '_clr=' | sed '/^[^=]*PATH/s/:/" "/g; s/^/set -xg /; s/=/ "/; s/$/" ;/; s/(//; s/)//')
  # clean up
  rm -f $env_file
end
