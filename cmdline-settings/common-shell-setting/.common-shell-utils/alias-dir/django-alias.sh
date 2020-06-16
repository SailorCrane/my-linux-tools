# vim: set foldmethod=marker  foldlevel=0:

alias djas="django-admin  startproject"
alias djasp="django-admin startapp"

djope="python   manage.py"
djope2="python2 manage.py"
djope3="python3 manage.py"
alias djr="${djope}   runserver 0.0.0.0:8000"
alias djr3="${djope3} runserver 0.0.0.0:8000"

alias djs="${djope}   shell"
alias djs3="${djope3} shell"

alias djds="${djope}   dbshell"
alias djds2="${djope2} dbshell"
alias djds3="${djope3} dbshell"

alias djv="${djope}   validate"        # 验证模型语法正确性
alias djv2="${djope2} validate"        # 验证模型语法正确性
alias djv3="${djope3} check"           # since django 1.7, it's check

alias djmm="${djope}   makemigrations"   # generate migration
alias djmm2="${djope2} makemigrations"   #
alias djmm3="${djope3} makemigrations"   #

# alias djm="${djope}   syncdb"        # generate sql
# alias djm2="${djope2} syncdb"        # generate sql
alias djm3="${djope3} migrate"    # since django 1.7, it's check


# ===================  model =====================
# NOTE: make + migrate
 alias djma="${djope}   makemigrations && ${djope}  migrate"
 alias djma2="${djope2} makemigrations && ${djope2} migrate"
 alias djma3="${djope3} makemigrations && ${djope3} migrate"

# alias djsa="${djope}   sqlall"        # generate sql
# alias djsa2="${djope2} sqlall"        #
# alias djsa3="${djope3} sqlmigrate"    # since django 1.7, it's check

alias djsu="${djope}   createsuperuser"
alias djsu2="${djope2} createsuperuser"
alias djsu3="${djope3} createsuperuser"

# show migrations of all app
alias djsm="${djope}   showmigrations"
alias djsm2="${djope2} showmigrations"
alias djsm3="${djope3} showmigrations"
