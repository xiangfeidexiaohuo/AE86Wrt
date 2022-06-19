#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================

## RK优化
wget -P target/linux/rockchip/armv8/base-files/etc/init.d/ https://github.com/friendlyarm/friendlywrt/raw/master-v22.03/target/linux/rockchip/armv8/base-files/etc/init.d/fa-fancontrol
wget -P target/linux/rockchip/armv8/base-files/etc/rc.d/ https://github.com/friendlyarm/friendlywrt/raw/master-v22.03/target/linux/rockchip/armv8/base-files/etc/rc.d/S21fa-fancontrol

wget -P target/linux/rockchip/armv8/base-files/usr/bin/ https://github.com/friendlyarm/friendlywrt/raw/master-v22.03/target/linux/rockchip/armv8/base-files/usr/bin/cputemp.sh
wget -P target/linux/rockchip/armv8/base-files/usr/bin/ https://github.com/friendlyarm/friendlywrt/raw/master-v22.03/target/linux/rockchip/armv8/base-files/usr/bin/fa-fancontrol-direct.sh
wget -P target/linux/rockchip/armv8/base-files/usr/bin/ https://github.com/friendlyarm/friendlywrt/raw/master-v22.03/target/linux/rockchip/armv8/base-files/usr/bin/fa-fancontrol.sh


cp -af feeds/xiangfeidexiaohuo/patch/opkg  target/linux/rockchip/armv8/base-files/etc/

