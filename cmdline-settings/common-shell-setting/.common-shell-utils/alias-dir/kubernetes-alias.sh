
# =================== kubeadm, kubelet etc... =====================
alias kubeadm_imgs="kubeadm config images list"         # kubeadm init需要的所有images(包括tag版本号)


# =================== kubectl alias =====================
# 1: kubernetes components system service
alias ksss="sudo systemctl status etcd kube-apiserver kube-controller-manager kube-scheduler \
        flanneld docker kubelet kube-proxy"
alias msss="sudo systemctl status etcd kube-apiserver kube-controller-manager kube-scheduler"
alias nsss="sudo systemctl status flanneld docker kubelet kube-proxy"


alias kstop="sudo systemctl stop etcd kube-apiserver kube-controller-manager kube-scheduler \
        flanneld docker kubelet kube-proxy"

alias kst="sudo systemctl start etcd kube-apiserver kube-controller-manager kube-scheduler \
        flanneld docker kubelet kube-proxy"

alias kre="sudo systemctl restart etcd kube-apiserver kube-controller-manager kube-scheduler \
        flanneld docker kubelet kube-proxy"

# alias sssm="sudo systemctl status etcd kube-apiserver kube-controller-manager kube-scheduler"
# alias sssn="sudo systemctl status flanneld docker kubelet kube-proxy"


# 2 kubectl
alias kctl="kubectl"
alias kinfo="kubectl cluster-info"
alias kyaml="kubectl get -o yaml"
alias kdes="kubectl describe"
alias kedi="kubectl edit"

alias kcre="kubectl create  -f"     # specify a file
alias krep="kubectl replace -f"     # specify a file
alias kapp="kubectl apply   -f"     # specify a dir/file, if need recursive dir, add -R
alias krun="kubectl run name-is-nginx --image=nginx --replicas=1"       # create deployment
alias kexp="kubectl expose"

alias klog="kubectl logs"
alias kexec="kubectl exec -it"


alias klab="kubectl label"

alias kconf="kubectl config"
alias kview="kubectl config view"       # view config
alias kctx="kubectl config current-context" # show current-context
alias kuse="kubectl config use-context"

alias kresource="kubectl api-resource"  # list all resource url
alias kproxy="kubectl proxy --address=0.0.0.0 --port=8888"

# =================== kctl del object =====================
alias kdel="kubectl delete"
alias kdela="kdel service,rc,rs,daemonsets,deploy,pods --all"
#alias kdela="kubectl delete --all pods && kubectl delete --all"
alias kdelsvc="kubectl delete svc"
alias kdeldep="kubectl delete deploy"
alias kdelp="kubectl delete pod"
alias kdelpod="kubectl delete pod"
alias kdelrc="kubectl delete rc"
alias kdelrs="kubectl delete rs"

# =================== kctl get object =====================
alias kget="kubectl get -o wide"
alias kgetpod="kget pod"
alias kgetpoda="kget pod --all-namespaces"
alias kgetsvc="kget svc"
alias kgetrc="kget rc"
alias kgetrs="kget rs"
alias kgetdep="kget deploy"

alias kgetscr="kget secrets"
alias kgetpv="kget pv"
alias kgetpvc="kget pvc"
alias kgetevent="kget events"

alias kgetno="kget nodes"
alias kgetnode="kget nodes"
alias kgetns="kget namespaces"
alias kgetcm="kget configmap"

# ===================  Authorization =====================
alias kgetrl="kget role"         #
alias kgetcrl="kget clusterrole" # admin, cluster-admin是k8s默认clusterrole

alias kgetsa="kget sa"
#alias kgetusr="kget user"      # 没有user资源?

alias kgetrb="kget rolebinding"
alias kgetcrb="kget clusterrolebinding"


alias kgetctx="kubectl config get-contexts"     # current context

# =================== kctl describe object =====================
alias kdespod="kubectl describe pod"
alias kdessvc="kubectl describe svc"
alias kdesdep="kubectl describe deploy"

alias kdessa="kubectl describe sa"
alias kdesscr="kubectl describe secrets"

alias kdesno="kubectl describe nodes"
alias kdesnm="kubectl describe namespaces"
