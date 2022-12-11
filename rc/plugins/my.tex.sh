# ENV for texnotes
export DATA_TEXNOTES=$DATA_ROOT/texnotes
function my.texnote.updatedb {
    export MY_FILE_TEX_NOTES=`find $DATA_TEXNOTES -iname '*.tex'`
}
