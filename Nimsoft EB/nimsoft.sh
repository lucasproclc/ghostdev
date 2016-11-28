#!/bin/bash
## Eric Lucas 11/28

cd /opt

curl -ks {{ config }} -o nms-robot-vars.cfg
chmod +x nms-robot-vars.cfg

wget {{ linuxrhel }}
chmod +x nimsoft-robot.x86_64.rpm

rpm -ivh nimsoft-robot.x86_64.rpm

cd /opt/nimsoft/install
bash RobotConfigurer.sh

/etc/init.d/nimbus start

chkconfig --level 345 nimbus on