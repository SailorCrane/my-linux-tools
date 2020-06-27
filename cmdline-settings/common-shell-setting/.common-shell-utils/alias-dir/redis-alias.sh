
alias redis="redis-cli"
alias rediss="redis-server"

alias redis_cluster="redis-cli -p 6379 cluster info"
alias redis_nodes="redis-cli -p 6379 cluster nodes"
alias redis_slot="redis-cli -p 6379 cluster keyslot"        # redis_slot "a" : key ===> slot
