# vim: set foldmethod=marker  foldlevel=0:

# python
alias py=python       # "python" is too long
alias py2=python2     # "python" is too long
alias py3=python3     # "python" is too long

# ipython
alias ipy=ipython
alias ipy3=ipython3

alias ipyl="ipython --pylab"
alias ipyl3="ipython3 --pylab"

# py run module
alias pym="python -m"
alias pym2="python2 -m"
alias pym3="python3 -m"

# pylint
alias pyl="pylint --list-msgs |grep"

# unittest
alias pyunit="python -m unittest"

# =================== pip =====================
# 同一个package, 不要同时安装apt和pip版的: 比如guake, python3-pip/pip, shadowsocks(会冲突, 因为响应的python-lib库只会安装一份)
# pip file
alias  pipf="pip  show -f"
alias pipf2="pip2 show -f"
alias pipf3="pip3 show -f"

# pip install
alias  pipi="sudo pip  install"
alias pipi2="sudo pip2 install"
alias pipi3="sudo pip3 install"

# pip install without sudo(root)
alias  pipis="pip  install"
alias pipis2="pip2 install"
alias pipis3="pip3 install"

# pip_douban
alias pip_douban="sudo  pip  install -i https://pypi.douban.com/simple"
alias pip_douban2="sudo pip2 install -i https://pypi.douban.com/simple"
alias pip_douban3="sudo pip3 install -i https://pypi.douban.com/simple"

# pip install --upgrade
alias  pipiu="sudo pip  install --upgrade"
alias pipiu2="sudo pip2 install --upgrade"
alias pipiu3="sudo pip3 install --upgrade"

# 更新youtube-dl
# sudo -H pip3 install --upgrade youtube-dl

alias egg="easy_install"   # install egg file

# delete/drop/uninstall
alias  pipd="sudo pip  uninstall"
alias pipd2="sudo pip2 uninstall"
alias pipd3="sudo pip3 uninstall"

# pip upgrade
alias  pipu="sudo pip  install --upgrade pip"
alias pipu2="sudo pip2 install --upgrade pip"
alias pipu3="sudo pip3 install --upgrade pip"

# coverage test analysis
alias cov="coverage"
alias covr="coverage run --branch"  # if, else branch analysis
alias covp="coverage report -m"     # -m : miss statement
alias covh="mkdir -p covhtml && coverage html -d covhtml && open covhtml/index.html"

alias dis="python -m dis"         # dis   main.py
alias dis2="python2 -m dis"       # dis2  main.py
alias dis3="python3 -m dis"       # dis3  main.py

# django
alias instdj="sudo pip2 install django==1.11"

# python -c
alias pypath="python   -c 'import sys,pprint; pprint.pprint(sys.path)'"
alias pypath2="python2 -c 'import sys,pprint; pprint.pprint(sys.path)'"
alias pypath3="python3 -c 'import sys,pprint; pprint.pprint(sys.path)'"

alias pysys="python   -c 'import sys,pprint; pprint.pprint(dir(sys))'"
alias pysys2="python2 -c 'import sys,pprint; pprint.pprint(dir(sys))'"
alias pysys3="python3 -c 'import sys,pprint; pprint.pprint(dir(sys))'"

# alias instdj2="sudo pip2 install django==1.11"
# alias instdj3="sudo pip2 install django==1.11"

# 不常用
# ------------------- virtualenv ---------------------
# virtualenv(被virtualenvwrapper替代, 在source-virtualenv-wrapper.sh中)
alias ve="virtualenv"
alias ve2="virtualenv2"
alias ve3="virtualenv3"
alias act="source bin/activate"
alias deact="deactivate"

# ------------------- pipenv ---------------------
# NOTE: pipenv: 最好用的python项目管理工具
# pipenv 安装: pip3 install --user pipenv  # NOTE: 安装到用户目录
alias pei='pipenv install'      # 为当前项目/目录,生成pipenv的配置文件
alias pes='pipenv shell'        # 进入当前项目/目录的pipenv
alias pex='pipenv exit'
alias peg='pipenv graph'
alias pev='pipenv --venv'       # 显示当前pipenv的信息

# ------------------- scrapy ---------------------
# scrapy(spider)
alias scrs="scrapy startproject"        # scrs example/tutorial
alias scrl="scrapy shell www.baidu.com" # scrl 'https://www.baidu.com'
alias scrc="scrapy crawl"               # scrc example/tutorial
alias scrg="scrapy genspider"           # scrc example/tutorial
alias scre="scrapy edit"                # scrc example/tutorial
alias scrG="scrapy settings --get"                # scrc example/tutorial
alias scrGb="scrapy settings --get DOWNLOADER_MIDDLEWARES_BASE"                # scrc example/tutorial

 # list
 # check
 # edit
 # fetch
 # view
 # crawl example -o quotes.json

# ------------------- FAQ/问题解决 ---------------------
# pip2安装ujson失败: 需要安装python-dev, build-essential
# pip3安装ujson失败: 需要安装python3-dev, build-essential
