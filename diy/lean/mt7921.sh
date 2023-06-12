#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================


##MT7921
rm -rf package/kernel/mt76
cp -af feeds/xiangfeidexiaohuo/patch/mt76 package/kernel/

##快速出来WiFi
sed -i "s/exit\ 0/wifi\ config\ \&\&\ wifi\nexit\ 0/g"  target/linux/rockchip/armv8/base-files/etc/board.d/02_network

