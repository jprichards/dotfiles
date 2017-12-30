export PATH="/usr/local/bin:/usr/local/sbin:$PATH:/usr/libexec:/usr/local/vfuse"
HOMEBREW_NO_ANALYTICS=1
export PS1="\A \u @ \W \\$  "
export HOMEBREW_GITHUB_API_TOKEN=[TOKEN]

export LSCOLORS=gxfxcxdxbxegedabagacad

alias ll='ls -lahG'
alias home='cd ~'
alias up='cd ..'
alias h='history'

alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'

alias vc='virtualenv ./.venv/'
alias vc3='virtualenv -p python3 ./.venv/'
alias va='source .venv/bin/activate'
alias vd='deactivate'

alias pdw='pwd'
alias delds="find . -name '*.DS_Store' -type f -delete"

mcd () {
    mkdir -p "$1"
    cd $1
}

ssdir () {
    defaults write com.apple.screencapture location "$1"
    killall SystemUIServer
}

movc () {
    ffmpeg -i $1 -c:v libx264 -preset fast "${1%.mov}"-opt.mov
    newname="${1%.mov}"-opt.mov
    origsize=`du -k "$1" | cut -f1`
    newsize=`du -k $newname | cut -f1`

    echo  -e '\n'$1   $origsize"KB"
    echo  $newname   $newsize"KB"
}

mp4c () {
  ffmpeg -i $1 -c:v libx264 -preset fast "${1%.mp4}"-opt.mp4
  newname="${1%.mp4}"-opt.mp4
  origsize=`du -k "$1" | cut -f1`
  newsize=`du -k $newname | cut -f1`

  echo  -e '\n'$1   $origsize"KB"
  echo  $newname   $newsize"KB"
}

mpgc () {
    ffmpeg -i $1 -c:v libx264 -preset fast "${1%.mpg}"-opt.mpg
    newname="${1%.mpg}"-opt.mpg
    origsize=`du -k "$1" | cut -f1`
    newsize=`du -k $newname | cut -f1`

    echo  -e '\n'$1   $origsize"KB"
    echo  $newname   $newsize"KB"
}

appimg () {

  FILE=$1
  # FILENAME="${FILE%%.*}"
  # FILEDIR=$(dirname $1)
  #
  # mkdir $FILENAME
  # cd $FILENAME

  sips -s format png $1 --out "${FILE%%.*}.png"
  cp $1 "${FILE%%.*}-orig.png"
  sips -Z 1028 $1
  cp $1 "${FILE%%.*}-1028.png"
  sips -Z 512 $1
  cp $1 "${FILE%%.*}-512.png"
  sips -Z 256 $1
  cp $1 "${FILE%%.*}-256.png"
  sips -Z 128 $1
  cp $1 "${FILE%%.*}-128.png"
  sips -Z 64 $1
  cp $1 "${FILE%%.*}-64.png"
  sips -Z 32 $1
  cp $1 "${FILE%%.*}-32.png"
  sips -Z 16 $1
  cp $1 "${FILE%%.*}-16.png"

  # echo "Image files stored in $FILENAME"

}