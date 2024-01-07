# ENV for notes
export DATA_NOTES=$DATA_ROOT/notes
function my.notes.updatedb {
    export MY_MD_NOTES=`find $DATA_NOTES -iname '*.md'`
}

