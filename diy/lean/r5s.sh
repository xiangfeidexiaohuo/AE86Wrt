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
sed -i "s/openwrt\/mt76/littoy\/mt76/g" package/kernel/mt76/Makefile

