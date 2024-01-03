# ENV for note-projects
export DATA_PROJECTS=$DATA_ROOT/projects
function my.projects.updatedb {
    export MY_MD_projects=`find $DATA_PROJECTS -iname '*.md'`
}

