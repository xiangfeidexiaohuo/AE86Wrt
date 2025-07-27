#!/bin/bash
#=================================================
# DaoDao's script
#=================================================
##添加自己的插件库
rm -rf ./package/lean/k3screenctrl
rm -rf ./package/lean/autocore
               
sed -i "1isrc-git extraipk https://github.com/xiangfeidexiaohuo/extra-ipk\n" feeds.conf.default

sed -i 's/luci.git;openwrt-23.05/luci.git/g' feeds.conf.default
sed -i 's/luci.git;openwrt-24.10/luci.git/g' feeds.conf.default
