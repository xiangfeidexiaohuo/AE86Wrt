#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================
##添加自己的插件库
sed -i "1isrc-git add https://github.com/xiangfeidexiaohuo/op-add" feeds.conf.default
sed -i "2isrc-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages\n" feeds.conf.default
