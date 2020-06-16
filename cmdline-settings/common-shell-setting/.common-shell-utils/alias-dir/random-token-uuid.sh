
alias token="head -c 16 /dev/urandom | od -An -t x | tr -d ' '"
alias uuid="cat /proc/sys/kernel/random/uuid"           # version4 uuid
alias bootid="cat /proc/sys/kernel/random/boot_id"

