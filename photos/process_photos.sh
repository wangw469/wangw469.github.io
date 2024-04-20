shopt -s nocaseglob

for i in *.HEIC; do
    if [ -f "$i" ]; then
        echo $i
        heif-convert "$i" "${i%.*}.jpg";
        rm "$i";
    fi
done

for i in *.jpg; do
    echo $i
    width=$(ffprobe -v error -select_streams v:0 -show_entries stream=width -of default=noprint_wrappers=1:nokey=1 "$i")
    if [ "$width" -gt 1080 ]; then
        ffmpeg -i "$i" -map_metadata -1 -vf scale=1080:-1 -y "$i";
    fi
done

shopt -u nocaseglob

