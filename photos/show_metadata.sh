for i in *.jpg; do ffprobe -v quiet -show_format -show_streams -print_format json "$i"; done

for i in *.JPG; do ffprobe -v quiet -show_format -show_streams -print_format json "$i"; done

