#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================

##快速出来WiFi
sed -i "s/exit\ 0/wifi\ config\ \&\&\ wifi\nexit\ 0/g"  target/linux/rockchip/armv8/base-files/etc/board.d/02_network

sed -i "s/exit\ 0/wifi\ config\ \&\&\ wifi\nexit\ 0/g"  target/linux/x86/base-files/etc/board.d/02_network

##MT7921
rm -rf package/kernel/mt76
svn export https://github.com/immortalwrt/immortalwrt/trunk/package/kernel/mt76 ./package/kernel/mt76

