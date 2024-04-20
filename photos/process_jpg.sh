for i in *.jpg; do ffmpeg -i "$i" -map_metadata -1 -vf scale=1080:-1 -y "$i"; done
for i in *.JPG; do ffmpeg -i "$i" -map_metadata -1 -vf scale=1080:-1 -y "$i"; done


