#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================
##添加自己的插件库
sed -i "1isrc-git add https://github.com/xiangfeidexiaohuo/op-add" feeds.conf.default
sed -i "2isrc-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages" feeds.conf.default
sed -i "3isrc-git passwall https://github.com/xiaorouji/openwrt-passwall" feeds.conf.default
sed -i "4isrc-git helloworld https://github.com/fw876/helloworld\n" feeds.conf.default

