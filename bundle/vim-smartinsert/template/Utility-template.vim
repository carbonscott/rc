template |ffmpeg-jpg-to-mp4|
# ffmpeg -r 30 -f image2 -s 1920x1080 -i %04d.jpeg -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4
endtemplate

template |what-is-motherboard|
su -c 'dmidecode -t 2'
endtemplate

template |awk-file|
awk '{print ____}' ____
endtemplate

template |awk-begin|
BEGIN{____}
endtemplate

template |awk-if|
/____/ {____}
endtemplate
