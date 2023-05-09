#!bin/bash

dirs=("/publico" "/adm" "/ven" "/sec")
grps=("GRP_ADM" "GRP_VEN" "GRP_SEC")
users=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "amanda" "rogerio")

declare -A grpToDir
grpToDir=( ["GRP_ADM"]="/adm" ["GRP_VEN"]="/ven" ["GRP_SEC"]="/sec")

for dir in ${dirs[@]}; do
        mkdir $dir -m 770
done

chmod 777 /publico

for grp in ${grps[@]}; do
        groupadd $grp
        chgrp $grp ${grpToDir[$grp]}
done

for user in ${users[@]}; do
        useradd $user -m -p $(openssl passwd Senha123)
done

gpasswd -M carlos,maria,joao GRP_ADM
gpasswd -M debora,sebastiana,roberto GRP_VEN
gpasswd -M josefina,amanda,rogerio GRP_SEC
