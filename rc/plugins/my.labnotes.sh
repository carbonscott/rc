# ENV for lab-notebook
export DATA_LABNOTES=$DATA_ROOT/labnotes
function my.labnotes.updatedb {
    export MY_TEX_LABNOTES=`find $DATA_LABNOTES -iname '*.tex'`
}

function lab.new {
    # Unpack the parameter representing a file basename...
    FILE_BASENAME=$1

    # Create a main tex file associated with the basename...
    cp "$DATA_LABNOTES/main.labnotes.tex" "$DATA_LABNOTES/$FILE_BASENAME.tex"

    # Create a directory associated with the basename...
    mkdir -p "$DATA_LABNOTES/sections/$FILE_BASENAME"

    # Create starting files to write notes...
    touch "$DATA_LABNOTES/sections/$FILE_BASENAME/metadata.tex"
    touch "$DATA_LABNOTES/sections/$FILE_BASENAME/main001.tex"
    touch "$DATA_LABNOTES/sections/$FILE_BASENAME/summary.tex"

    # Report...
    printf "%s.tex is created.\n"                   "$FILE_BASENAME"
    printf "sections/%s is created.\n"              "$FILE_BASENAME"
    printf "sections/%s/metadata.tex is created.\n" "$FILE_BASENAME"
    printf "sections/%s/main001.tex is created.\n"  "$FILE_BASENAME"
    printf "sections/%s/summary.tex is created.\n"  "$FILE_BASENAME"
}
