# ============================================================================
# Python executable path ...
# ============================================================================

# Sync folder...
export SYNC_FOLDER="OneDrive - SLAC National Accelerator Laboratory"

# Python path...
export PYTHONPATH=""
export PYTHONPATH="$HOME/$SYNC_FOLDER/codes:$PYTHONPATH"
## # Uncomment for development purpose
## export PYTHONPATH="$HOME/$SYNC_FOLDER/codes/GnuplotPy3:$PYTHONPATH"
## export PYTHONPATH="$HOME/$SYNC_FOLDER/codes/pyrotein:$PYTHONPATH"
## export PYTHONPATH="$HOME/$SYNC_FOLDER/codes/pymolPy3:$PYTHONPATH"
## export PYTHONPATH="$HOME/$SYNC_FOLDER/codes/colorsimple:$PYTHONPATH"
export PYTHONPATH="$HOME/$SYNC_FOLDER/codes/search_rcsb:$PYTHONPATH"
export PYTHONPATH="$HOME/.local/lib64/python3.9/site-packages/:$PYTHONPATH"

# PDF split ...
export PATH="$HOME/$SYNC_FOLDER/utilities/pdf_utility:$PATH"

# inSituX -- serial crystallography software ...
export PATH="$HOME/$SYNC_FOLDER/codes/inSituX:$PATH"

# pme for pandoc, markdown and entr...
export PATH="$HOME/$SYNC_FOLDER/codes/pme:$PATH"

# texpro for LaTeX...
export PATH="$HOME/$SYNC_FOLDER/codes/texpro:$PATH"

# time difference in days...
export PATH="$HOME/$SYNC_FOLDER/codes/deltat:$PATH"

# pdf2txt, word count...
export PATH="$HOME/$SYNC_FOLDER/codes/wordcount:$PATH"

# virtualenv -- Python 3.9
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
