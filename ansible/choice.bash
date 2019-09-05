#!/bin/sh

awk '/mysql_version/{getline var;print var}' /etc/ansible/hosts >/etc/ansible/1.txt
awk '/mysql_deploy_way/{getline var;print var}' /etc/ansible/hosts >/etc/ansible/2.txt
awk '/promethues/{getline var;print var}' /etc/ansible/hosts >/etc/ansible/3.txt
mysql_version=$(cat /etc/ansible/1.txt)
mysql_deploy_way=$(cat /etc/ansible/2.txt)
promethues=$(cat /etc/ansible/3.txt)
if [[ $mysql_version = mysql57 ]] 
then
   if [[ $mysql_deploy_way = high ]]
   then
     if [[ $promethues = yes ]]
     then
       echo "playbook-mysql57-high-promethues"
       ansible-playbook /etc/ansible/roles/playbooks/playbook-mysql57-high-promethues
     else
       echo "playbook-mysql57-high"
       ansible-playbook /etc/ansible/roles/playbooks/playbook-mysql57-high
     fi
   else
     if [[ $promethues = yes ]]
     then
       echo "playbook-mysql57-single-promethues"
       ansible-playbook /etc/ansible/roles/playbooks/playbook-mysql57-single-promethues
     else    
       echo "playbook-mysql57-single"
       ansible-playbook /etc/ansible/roles/playbooks/playbook-mysql57-single
     fi
   fi
else
   if [[ $mysql_deploy_way = high ]]
   then
     if [[ $promethues = yes ]]
     then
       echo "playbook-mysql56-high-promethues"
       ansible-playbook /etc/ansible/roles/playbooks/playbook-mysql56-high-promethues
     else
       echo "playbook-mysql56-high"
       ansible-playbook /etc/ansible/roles/playbooks/playbook-mysql56-high
     fi
   else
     if [[ $promethues = yes ]]
     then
       echo "playbook-mysql56-single-promethues"
       ansible-playbook /etc/ansible/roles/playbooks/playbook-mysql56-single-promethues
     else
       echo "playbook-mysql56-single"
       ansible-playbook /etc/ansible/roles/playbooks/playbook-mysql56-single
     fi
   fi  
fi
