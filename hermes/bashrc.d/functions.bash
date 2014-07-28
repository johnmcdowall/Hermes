function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

function gifify() {
  if [[ -n "$1" ]]; then
    ffmpeg -i $1 -r 20 -vcodec png out-static-%05d.png
    time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
    rm out-static*.png
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

function dev-env(){
  project_name=`basename "$1"`

  tmux has-session -t "$project_name"

  if [ $? != 0 ] ; then
    # Create the new tmux session
    tmux new-session -s "$project_name" -n editor -d

    # Go into the project directory
    tmux send-keys -t "$project_name" "cd \"$1\"" C-m

    # Open vim
    tmux send-keys -t "$project_name" 'vim' C-m
    # Open NERDTree
    tmux send-keys -t "$project_name" ,n

    # Split the window
    tmux split-window -v -p 15 -t "$project_name"

    tmux select-layout -t "$project_name" main-horizontal

    # in the terminal window, move to the project directory
    # this is the small terminal window. 
    tmux send-keys -t "$project_name":1.1 "cd \"$1\";clear" C-m
    tmux select-pane -t 1
    tmux resize-pane -D 15

    # Create a full screen console
    tmux new-window -n console -t "$project_name"
    tmux send-keys -t "$project_name:2" "cd \"$1\";clear" C-m

    # Select the first window (with vim and small terminal)
    tmux select-window -t "$project_name:1"
  fi

  tmux attach -t "$project_name"
 }

function hack() {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || exit 0
 CURRENT="${ref#refs/heads/}"
 git checkout master
 git pull origin master
 git checkout ${CURRENT}
 git rebase master
}

function ship() {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || exit 0
 CURRENT="${ref#refs/heads/}"
 git checkout master
 git merge ${CURRENT}
 git push origin master
 git checkout ${CURRENT}
}

function dwf() {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || exit 0
 CURRENT="${ref#refs/heads/}"
 git checkout master
 git branch -d ${CURRENT}
}
