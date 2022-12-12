# ENV for lab-notebook
export DATA_LABNOTES=$DATA_ROOT/labnotes
function my.labnotes.updatedb {
    export MY_FILE_TEX_LABNOTES=`find $DATA_LABNOTES -iname '*.tex'`
}
