#!/bin/bash
#=================================================
# DaoDao's script
#=================================================
##添加自己的插件库
rm -rf ./package/lean/k3screenctrl
rm -rf ./package/lean/autocore

sed -i "1isrc-git tiger https://github.com/xiangfeidexiaohuo/tiger\n" feeds.conf.default          
sed -i "2isrc-git extraipk https://github.com/xiangfeidexiaohuo/extra-ipk\n" feeds.conf.default

sed -i 's/#src-git luci/src-git luci/g' feeds.conf.default
sed -i '/luci.git;openwrt-23.05/d' feeds.conf.default
sed -i '/luci.git;openwrt-24.10/d' feeds.conf.default
