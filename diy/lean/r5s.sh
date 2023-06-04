#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================

rm -rf target/linux/rockchip/armv8/base-files/etc/init.d/fa-fancontrol
rm -rf target/linux/rockchip/armv8/base-files/etc/rc.d/S21fa-fancontrol
rm -rf target/linux/rockchip/armv8/base-files/usr/bin/cputemp.sh
rm -rf target/linux/rockchip/armv8/base-files/usr/bin/fa-fancontrol-direct.sh
rm -rf target/linux/rockchip/armv8/base-files/usr/bin/fa-fancontrol.sh


##MT7921
rm -rf package/kernel/mt76
cp -af feeds/xiangfeidexiaohuo/patch/mt76 package/kernel/

