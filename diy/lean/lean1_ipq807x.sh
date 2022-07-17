#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================
##添加自己的插件库
rm -rf ./package/lean/k3screenctrl
rm -rf ./package/lean/autocore
##boos
rm -rf ./package/lean/baidupcs-web
rm -rf ./package/lean/dns2socks
rm -rf ./package/lean/frp
rm -rf ./package/lean/ipt2socks
rm -rf ./package/lean/microsocks
rm -rf ./package/lean/mtk-eip93
rm -rf ./package/lean/pdnsd-alt
rm -rf ./package/lean/qBittorrent
rm -rf ./package/lean/qBittorrent-static
rm -rf ./package/lean/qttools
rm -rf ./package/lean/simple-obfs
rm -rf ./package/lean/tcpping
rm -rf ./package/lean/trojan
rm -rf ./package/lean/verysync
rm -rf ./package/lean/vlmcsd
##
rm -rf ./package/qca
               
sed -i "1isrc-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages" feeds.conf.default
sed -i "2isrc-git ipkg https://github.com/xiangfeidexiaohuo/op-ipkg" feeds.conf.default
sed -i "3isrc-git nss_packages https://github.com/robimarko/nss-packages.git\n"  feeds.conf.default

