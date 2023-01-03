# ENV for texnotes
export DATA_TEXNOTES=$DATA_ROOT/texnotes
function my.texnote.updatedb {
    export MY_FILE_TEX_NOTES=`find $DATA_TEXNOTES -iname '*.tex'`
}

function tex.new {
    # Unpack the parameter representing a file basename...
    FILE_BASENAME=$1

    # Create a main tex file associated with the basename...
    cp "$DATA_TEXNOTES/main.notes.tex" "$DATA_TEXNOTES/$FILE_BASENAME.tex"

    # Create a directory associated with the basename...
    mkdir -p "$DATA_TEXNOTES/sections/$FILE_BASENAME"

    # Create starting files to write notes...
    touch "$DATA_TEXNOTES/sections/$FILE_BASENAME/metadata.tex"
    touch "$DATA_TEXNOTES/sections/$FILE_BASENAME/main001.tex"
    touch "$DATA_TEXNOTES/sections/$FILE_BASENAME/summary.tex"

    # Report...
    printf "%s.tex is created.\n"                   "$FILE_BASENAME"
    printf "sections/%s is created.\n"              "$FILE_BASENAME"
    printf "sections/%s/metadata.tex is created.\n" "$FILE_BASENAME"
    printf "sections/%s/main001.tex is created.\n"  "$FILE_BASENAME"
    printf "sections/%s/summary.tex is created.\n"  "$FILE_BASENAME"
}
