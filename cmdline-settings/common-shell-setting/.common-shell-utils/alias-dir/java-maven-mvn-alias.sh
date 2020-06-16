# vim: set foldmethod=marker  foldlevel=0:

# 在项目目录中执行, 包含pom.xml的目录
alias mvg="mvn archetype:generate"      #  mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app
alias mvc="mvn clean"
alias mvp="mvn package"                 # HINT: NOTE: 执行这个命令编译, 并且生成jar包.(flink使用)
alias mvi="mvn install"
alias mvt="mvn test"
alias mvb="mvn compile"     # mvb: mvn build

alias mvr='mvn exec:java -Dexec.mainClass="myflink.BsonTest"'     # package myflink, BsonTest main class, NOTE: 运行main函数


# 流程
# mvg -DgroupId=com.mycompany.app -DartifactId=my-app       # 创建
# mvp                                                       # 编译(在pom.xml目录)
# mvn exec:java -Dexec.mainClass="myflink.BsonTest"         # 运行(具有main()函数的class)
