#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================
##添加自己的插件库
rm -rf ./package/lean/k3screenctrl
rm -rf ./package/lean/luci-app-syncdial
rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/luci-app-jd-dailybonus
#rm -rf ./package/lean/luci-app-diskman
rm -rf ./package/lean/luci-lib-docker
rm -rf ./package/lean/luci-app-pushbot
rm -rf ./package/lean/luci-app-netdata
rm -rf ./package/lean/aliyundrive-webdav
rm -rf ./package/lean/luci-app-aliyundrive-webdav
rm -rf ./package/lean/go-aliyundrive-webdav
rm -rf ./package/lean/luci-app-go-aliyundrive-webdav
rm -rf ./package/lean/luci-app-easymesh
rm -rf ./package/lean/autocore
rm -rf ./package/lean/luci-app-cpufreq
rm -rf ./package/lean/luci-app-kodexplorer
               
sed -i "1isrc-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages" feeds.conf.default
sed -i "2isrc-git passwall https://github.com/xiaorouji/openwrt-passwall" feeds.conf.default
sed -i "3isrc-git helloworld https://github.com/fw876/helloworld\n" feeds.conf.default

