function sshlogin {
    ssh -t -X $1 BG_COLOR=$BG_COLOR exec bash
}

function pslogin.login {
    pass -c slac.unix    # A shortcut mainly used for convenience
    ssh -t -X cwang31@pslogin.slac.stanford.edu BG_COLOR=$BG_COLOR exec bash
}

###############################################################################
# The following ssh session requires proxy jump.  
# Example config needs to be set up in $HOME/.ssh/config
#
# Host pslogin.slac.stanford.edu
#   HostName pslogin.slac.stanford.edu
#   User cwang31
#
# Host psana
#   HostName psana
#   User cwang31
#   ProxyJump pslogin.slac.stanford.edu
#
# Host perlmutter.nersc.gov
#   HostName perlmutter.nersc.gov
#   User cwang31
###############################################################################
function psana.login {
    pass -c slac.unix    # A shortcut mainly used for convenience
    ssh -t -X cwang31@psana BG_COLOR=$BG_COLOR exec bash
}


function nersc.login {
    pass -c nersc    # A shortcut mainly used for convenience
    ssh -t -X cwang31@perlmutter.nersc.gov BG_COLOR=$BG_COLOR exec bash
}


function s3df.login {
    pass -c slac.unix    # A shortcut mainly used for convenience
    ssh -t -X cwang31@s3dflogin.slac.stanford.edu BG_COLOR=$BG_COLOR exec bash
}


function olcf.login {
    pass -c olcf.pin    # A shortcut mainly used for convenience
    ssh -t -X cwang31@home.ccs.ornl.gov BG_COLOR=$BG_COLOR exec bash
}


function pc100146.login {
    pass -c slac.win    # A shortcut mainly used for convenience
    ssh -t -X cwang31@pc100146.local BG_COLOR=$BG_COLOR exec bash
}


function summit.login {
    # Set up the folloing in the .ssh/config
    # --------------------------------------
    # Host summit3
    # HostName login3.summit.olcf.ornl.gov
    # User cwang31
    # ProxyJump home.ccs.ornl.gov
    # --------------------------------------
    pass -c olcf.pin    # A shortcut mainly used for convenience
    ssh -t -X summit3 BG_COLOR=$BG_COLOR exec bash
}
