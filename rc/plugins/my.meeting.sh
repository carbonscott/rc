# ENV for meetings
export DATA_MEETING=$DATA_ROOT/meetings
function my.meeting.updatedb {
    export MY_TEX_MEETING=`find $DATA_MEETING -iname '*.tex'`
    export MY_MD_MEETING=`find $DATA_MEETING -iname '*.md'`
}

