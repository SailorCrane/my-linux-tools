#! /bin/sh
#
# ipc-about.sh
# Copyright (C) 2017 root <root@crane>
#
# Distributed under terms of the MIT license.
#

ipcrm-private()
{
    #local option="-m"
    local option=$1

    local IPC_PRIVATE=0x00000000

    for IpcId in $(ipcs $option | grep $IPC_PRIVATE | col 2 )
    do
        ipcrm $option $IpcId
    done
}

# delete IPC_PRIVATE ipc object
alias ipcrm-private-msg="ipcrm-private     -q"    # q stand for msg queue
alias ipcrm-private-memory="ipcrm-private  -m"    # m stand for memory
alias ipcrm-private-sem="ipcrm-private     -s"    # s stand for semaphore

# delete by ipc id
alias ipcrm-q="ipcrm  -q"    # q stand for msg queue
alias ipcrm-m="ipcrm  -m"    # m stand for memory
alias ipcrm-s="ipcrm  -s"    # s stand for semaphore


alias ipcs-q="ipcs -q"       # queue(msg)
alias ipcs-m="ipcs -m"       # memory(shared memory)
alias ipcs-s="ipcs -s"       # semaphore
