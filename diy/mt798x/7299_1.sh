#!/bin/bash
#=================================================
# DaoDao's script (TL-7DR7299 pre-feeds, 移植自 huladabang/openwrt-7dr7299)
#=================================================

##添加自己的插件库
sed -i "1isrc-git 2305ipk https://github.com/xiangfeidexiaohuo/2305-ipk\n" feeds.conf.default

##首次启动无预设密码，LuCI 会引导设置
sed -i -E 's|^root:[^:]*:|root::|' package/base-files/files/etc/shadow
