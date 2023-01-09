# ENV for todo
export DATA_TODO=$DATA_ROOT/todo
function my.todo.updatedb {
    export MY_TEX_TODO=`find $DATA_TODO -iname '*.tex'`
}

function todo.new {
    # Unpack the parameter representing a file basename...
    FILE_BASENAME=$1

    # Create a main todo file associated with the basename...
    cp "$DATA_TODO/main.notes.tex" "$DATA_TODO/$FILE_BASENAME.tex"

    # Create a directory associated with the basename...
    mkdir -p "$DATA_TODO/sections/$FILE_BASENAME"

    # Create starting files to write notes...
    touch "$DATA_TODO/sections/$FILE_BASENAME/metadata.tex"
    touch "$DATA_TODO/sections/$FILE_BASENAME/main001.tex"
    touch "$DATA_TODO/sections/$FILE_BASENAME/summary.tex"

    # Report...
    printf "%s.tex is created.\n"                   "$FILE_BASENAME"
    printf "sections/%s is created.\n"              "$FILE_BASENAME"
    printf "sections/%s/metadata.tex is created.\n" "$FILE_BASENAME"
    printf "sections/%s/main001.tex is created.\n"  "$FILE_BASENAME"
    printf "sections/%s/summary.tex is created.\n"  "$FILE_BASENAME"
}

