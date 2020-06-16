# vim: set foldmethod=marker  foldlevel=0:

# 46 apt-about
#alias ppadel="sudo ppa-purge"
alias ppadel="sudo add-apt-repository --remove"
alias ppaadd="sudo add-apt-repository"

#===================  apt =====================
alias aptU="sudo apt-get install --only-upgrade" # aptU package_name
alias apt-upgrade="sudo apt-get install --only-upgrade" # aptU package_name

# NOTE: dpkg: warning files list file for package antlr, assuming package has no files currently installed.
# NOTE: reinstall (更新 /var/lib/dpkg/info/中信息, dpkg的数据库)
alias reins="sudo apt-get install --reinstall" # aptU package_name
alias reinstall="sudo apt-get install --only-upgrade" # aptU package_name

# NOTE: 在添加ppa后, 一般会用:  aptu download all package information from all configure source
alias aptu="sudo apt-get update"
alias aptUU="sudo apt-get upgrade"               # 更新所有软件包
alias apts="apt-get source"                      # download source
alias aptd="apt-get download"                    # download package

#install and search in function
alias down="apt-get download"
alias download="apt-get download"

# =================== deb =====================
alias dpkgl="dpkg -l" # list all packages in system
alias dpkgL="dpkg -L" # list all files in package
#alias debi="dpkg -i package.deb --force-not-root --root=$HOME"
#alias debi="dpkg -i --force-not-root --root=$HOME"

alias deb="sudo gdebi"      # to install deb(and resolve dependency)

# =================== apt-key =====================
alias apt_kl="apt-key list"
alias apt_ka="apt-key Add"
alias apt_kd="apt-key del"
alias apt_kdir="ls /etc/apt/trusted.gpg.d/"     # link for /usr/share/keyrings/

# =================== depends =====================
# 使用function 支持yum, apt-get
# alias depends="apt-cache depends"
# alias rdepends="apt-cache rdepends"
