# vim:set foldmethod=marker  foldlevel=0: vim modeline

FLINK_OPE="./flink"

flink_jobid()
{
    UsageMsg="Usage: flink_jobid <job-name>"

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    JobName=$1
    JobId=$($FLINK_OPE list | env grep $JobName | awk '{print $4}')
    echo $JobId
}

flink_cancel()
{
    UsageMsg="Usage:  flink_cancel <job-name>"

    if ! ParaUsage "${UsageMsg}" 1 $* ; then        # if 可以直接判断命令执行结果
        return -1
    fi

    JobName=$1
    JobId=$(flink_jobid $JobName)
    if [ -z $JobId ] ;then
        echo "has no job for name " "[$JobName]"
    else
        $FLINK_OPE cancel $JobId
    fi
}

alias flj="flink_jobid"
alias flc="flink_cancel"
alias fll="./flink list"



# ------------------- cancel所有的alarm_ 告警 任务 ---------------------
# # !/bin/bash

# flink_jobid () {
#         UsageMsg="Usage: flink_jobid <job-name>"
#         JobName=$1
#         JobId=$(./bin/flink list | env grep $JobName | awk '{print $4}')
#         echo $JobId
# }


# flink_cancel () {
#         UsageMsg="Usage:  flink_cancel <job-name>"
#         JobName=$1
#         JobIds=$(flink_jobid $JobName)

#         if [ -z $JobIds ]
#         then
#                 echo "has no job for name " "[$JobName]"
#         fi

#         for JobId in $JobIds ; do
#             # echo $jobId
#             ./bin/flink cancel $JobId
#         done
# }

# # flink_jobid alarm_
# flink_cancel alarm_
