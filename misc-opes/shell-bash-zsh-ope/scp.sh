# scp -p (preserve保留时间戳) : 这样scp后, 文件时间戳和本地相同. 不会因为scp, 所以导致时间戳修改, make不该make的

SSHIP=172.16.0.3
Ope="scp -p"        # 保留时间戳和权限等等
UserName=galaxyeye

# src header copy: disabled, use make install to copy
#scp *hpp  ${UserName}@${SSHIP}:/opt/Charlene2.2.0RC1/include/mts-db-header
#scp Record/*hpp  ${UserName}@${SSHIP}:/opt/Charlene2.2.0RC1/include/mts-db-header/Record

# source copy
${Ope}  ../DbAccess/*cpp  ${UserName}@${SSHIP}:/opt/Charlene2.2.0RC1/src/DbAccess
${Ope}  ../DbAccess/*hpp  ${UserName}@${SSHIP}:/opt/Charlene2.2.0RC1/src/DbAccess

# Record src
${Ope} Record/*hpp  ${UserName}@${SSHIP}:/opt/Charlene2.2.0RC1/src/DbAccess/Record
${Ope} Record/*cpp  ${UserName}@${SSHIP}:/opt/Charlene2.2.0RC1/src/DbAccess/Record

# CMakeLists.txt and  unit test
${Ope} ../DbAccess/test/CMakeLists.txt  ${UserName}@${SSHIP}:/opt/Charlene2.2.0RC1/src/DbAccess/test
${Ope} ../DbAccess/test/*.hpp           ${UserName}@${SSHIP}:/opt/Charlene2.2.0RC1/src/DbAccess/test
${Ope} ../DbAccess/test/*.cpp           ${UserName}@${SSHIP}:/opt/Charlene2.2.0RC1/src/DbAccess/test
