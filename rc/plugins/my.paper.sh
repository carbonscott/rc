# ENV for paper
export DATA_PAPERS=$DATA_ROOT/papers
function my.papers.updatedb {
    export MY_FILE_TEX_PAPERS=`find $DATA_PAPERS -iname '*.tex'`
}
