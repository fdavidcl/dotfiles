# I was bored. Don't judge
# `accio` is actually very useful :)
function accio() {
  find / -name $1 2> /dev/null
}

function alohomora() {
  xdg-open $1
}

function ascendio() {
  sudo su
}

function impedimenta() {
  chmod a-$1 $2
}

function lumos() {
  [[ $# -gt 0 ]] && (
    [[ $1 = "maxima" ]] && (
      ls -al
    ) || (
      ls
    )
  ) || (
    ls
  )
}

function obliviate() {
  rm -rf $1
}
