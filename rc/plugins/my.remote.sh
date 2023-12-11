function pslogin.login {
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
    ssh -t -X cwang31@psana BG_COLOR=$BG_COLOR exec bash
}


function nersc.login {
    ssh -t -X cwang31@perlmutter.nersc.gov BG_COLOR=$BG_COLOR exec bash
}


function s3df.login {
    ssh -t -X cwang31@s3dflogin.slac.stanford.edu BG_COLOR=$BG_COLOR exec bash
}


