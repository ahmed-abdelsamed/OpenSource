#!/bin/bash
username=admin
password=admin@123
echo “#################################### WELOCME TO RABBITMQ INSTALLATION SCRIPT ###############################”
sleep 1s;
echo “################################## INSTALLING DEPENDECIES & REQUIRED UTILS ###############################”
yum install vim htop telnet net-tools bind-utils -y && yum install -y openssl libssl-devel libudev-devel openssl-devel gityum groupinstall ‘Development Tools’ -y
echo “############################################ STARTED INSTALLING RABBITMQ #################################################”
yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v19.3.6.2/erlang-19.3.6.2-1.el7.centos.x86_64.rpm && yum install https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.6/rabbitmq-server-3.7.6-1.el6.noarch.rpm && systemctl start rabbitmq-server && systemctl enable rabbitmq-server && service rabbitmq-server status && rabbitmq-plugins enable rabbitmq_management && systemctl restart rabbitmq-server
echo “##################################### ADDING USER TO RABBITMQ ##########################”
sleep 1s;
rabbitmqctl add_user $username $password
echo “################################## SETTING RABBITMQ PERMISSONS ###################################”
sleep 1s;
rabbitmqctl set_permissions -p / $username “.*” “.*” “.*”
echo “################################ JUST FINAL SETUP PLEASE STAY PATIENT ############################”
rabbitmqctl set_user_tags $username administrator
echo “##############################RABBITMQ INSTALLED & CONFIGURED SUCESSFULLY ######################”
