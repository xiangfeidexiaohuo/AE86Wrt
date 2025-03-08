#!/bin/bash
#=================================================
# DaoDao's script
#=================================================
##添加自己的插件库
sed -i "1isrc-git extraipk https://github.com/xiangfeidexiaohuo/extra-ipk\n" feeds.conf.default
