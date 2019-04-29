ls -1 . | awk '{ print $1 " output"NR-1".mp4" }' | xargs -I{} ffmpeg {}

