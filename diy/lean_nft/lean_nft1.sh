#!/bin/bash
#=================================================
# DaoDao's script
#=================================================
##添加自己的插件库
rm -rf ./package/lean/k3screenctrl
               
sed -i "1isrc-git 2305ipk https://github.com/xiangfeidexiaohuo/2305-ipk\n" feeds.conf.default

sed -i 's/luci.git;openwrt-23.05/luci.git;openwrt-24.10/g' feeds.conf.default

