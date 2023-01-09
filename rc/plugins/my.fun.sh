# ENV for fun
export DATA_FUN=$DATA_ROOT/fun
function my.fun.updatedb {
    export MY_TEX_FUN=`find . -iname '*.tex'`
}

function fun.new {
    # Unpack the parameter representing a file basename...
    FILE_BASENAME=$1

    # Create a main tex file associated with the basename...
    cp main.notes.tex "$FILE_BASENAME.tex"

    # Create a directory associated with the basename...
    mkdir -p "sections/$FILE_BASENAME"

    # Create starting files to write notes...
    touch "sections/$FILE_BASENAME/metadata.tex"
    touch "sections/$FILE_BASENAME/main001.tex"
    touch "sections/$FILE_BASENAME/summary.tex"

    # Report...
    printf "%s.tex is created.\n"                   "$FILE_BASENAME"
    printf "sections/%s is created.\n"              "$FILE_BASENAME"
    printf "sections/%s/metadata.tex is created.\n" "$FILE_BASENAME"
    printf "sections/%s/main001.tex is created.\n"  "$FILE_BASENAME"
    printf "sections/%s/summary.tex is created.\n"  "$FILE_BASENAME"
}
