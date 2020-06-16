
# if has kubectl command: NOTE: bash
if env which kubectl >/dev/null 2>&1 ; then
    source <(kubectl completion bash)
fi
