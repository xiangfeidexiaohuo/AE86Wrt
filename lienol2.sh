#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================
##链接
ln -s -f ../../../feeds/xiangfeidexiaohuo/k3screenctrl package/feeds/xiangfeidexiaohuo/k3screenctrl
rm -rf package/feeds/packages/smartdns
ln -s -f ../../../feeds/xiangfeidexiaohuo/smartdns package/feeds/xiangfeidexiaohuo/smartdns

##补充汉化       
cp -f ./feeds/xiangfeidexiaohuo/files/udpxy.lua ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi
cp -f ./feeds/xiangfeidexiaohuo/files/mwan3.po ./feeds/luci/applications/luci-app-mwan3/po/zh-cn

cp -f ./feeds/xiangfeidexiaohuo/files/transmission.po ./feeds/luci/applications/luci-app-transmission/po/zh_Hans
              
 ##配置ip等
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm-k3|TARGET_DEVICES += phicomm-k3| ; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

##更改主机名
sed -i "s/hostname='OpenWrt'/hostname='AE86'/g" package/base-files/files/bin/config_generate

##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-argon/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-argon/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile

##清除登录密码
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/default-settings/files/zzz-default-settings

##加入作者信息
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION='$(date +%Y%m%d)'/g" package/default-settings/files/zzz-default-settings
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt SNAPSHOT '/DISTRIB_DESCRIPTION='OpenWrt YaoDao '/g" package/default-settings/files/zzz-default-settings


