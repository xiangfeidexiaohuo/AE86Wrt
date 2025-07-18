#!/bin/bash
#=================================================
# DaoDao's script
#=================================================
##添加自己的插件库
sed -i 's/git.openwrt.org\/feed/github.com\/openwrt/g' feeds.conf.default
sed -i 's/git.openwrt.org\/project/github.com\/openwrt/g' feeds.conf.default

echo -e "\nsrc-git 2305ipk https://github.com/xiangfeidexiaohuo/2305-ipk" >> feeds.conf.default
