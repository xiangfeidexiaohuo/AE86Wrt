#!/bin/bash
#=================================================
# DaoDao's script
#=================================================
##添加自己的插件库

sed -i "1isrc-git 2h69k_oled https://github.com/jjm2473/luci-app-oled.git;master\n" feeds.conf.default
sed -i "2isrc-git diskman https://github.com/jjm2473/luci-app-diskman.git;dev\n" feeds.conf.default
sed -i "3isrc-git oaf https://github.com/jjm2473/OpenAppFilter.git;dev6\n" feeds.conf.default
sed -i "4isrc-git jjm2473_apps https://github.com/jjm2473/openwrt-apps.git;main\n" feeds.conf.default

echo -e "\nsrc-git 2305ipk https://github.com/xiangfeidexiaohuo/2305-ipk" >> feeds.conf.default
