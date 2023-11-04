#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================
##添加自己的插件库
rm -rf ./package/lean/k3screenctrl
rm -rf ./package/lean/autocore
               
sed -i "1isrc-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages" feeds.conf.default

