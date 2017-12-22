template |import-mpi|
from mpi4py import MPI
endtemplate

template |MPI.COMM_WORLD|
MPI.COMM_WORLD
endtemplate

template |comm.Get_rank|
comm.Get_rank()
endtemplate

template |comm.Send|
comm.Send($Send:____,dest=____,tag=____)
endtemplate

template |comm.Recv|
comm.Recv($Send:____,source=____,tag=____)
endtemplate

template |comm.bcast|
comm.bcast($Send:____,root=____)
endtemplate

template |comm.Bcast|
comm.Bcast($Send:____,root=____)
endtemplate

template |comm.Get_size|
comm.Get_size()
endtemplate

template |comm.Reduce|
comm.Reduce($Send:____, $Recv:____, op=$operation:____,root=____)
endtemplate

template |comm.Disconnect|
comm.Disconnect()
endtemplate

template |comm.reduce|
comm.reduce($send:____,op=____,root=____)
endtemplate
