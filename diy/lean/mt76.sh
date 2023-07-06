#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================

##快速出来WiFi
sed -i "s/exit\ 0/wifi\ config\ \&\&\ wifi\nexit\ 0/g"  target/linux/rockchip/armv8/base-files/etc/board.d/02_network

sed -i "s/exit\ 0/wifi\ config\ \&\&\ wifi\nexit\ 0/g"  target/linux/x86/base-files/etc/board.d/02_network

##升级默认mt76版本
sed -i "s/969b7b5ebd129068ca56e4b0d831593a2f92382f/f704e4f83c6fd21fb39046fa328efb51bee6383b/g" package/kernel/mt76/Makefile
sed -i "s/2023-05-13/2023-07-04/g" package/kernel/mt76/Makefile

