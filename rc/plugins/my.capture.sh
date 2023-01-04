# ENV for note-capture
export DATA_CAPTURE=$DATA_ROOT/capture
function my.capture.updatedb {
    export MY_FILE_CAPTURE=`find $DATA_CAPTURE -iname '*.md'`
}

