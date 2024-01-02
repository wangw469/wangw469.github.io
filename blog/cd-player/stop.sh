# Try to kill the mpv process
lsof -t "$(mount | grep cddafs | awk -F'on | \\(' '{print $2}')" | xargs -I {} kill -KILL {}
