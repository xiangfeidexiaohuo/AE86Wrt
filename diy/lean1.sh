#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================
##添加自己的插件库
rm -rf ./package/lean/k3screenctrl
rm -rf ./package/lean/luci-app-syncdial
rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/luci-app-jd-dailybonus
rm -rf ./package/lean/luci-app-diskman
rm -rf ./package/lean/luci-lib-docker
               
echo -e "\nsrc-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages" >> feeds.conf.default
echo -e "src-git nas https://github.com/linkease/nas-packages.git;master" >> feeds.conf.default
echo -e "src-git passwall https://github.com/xiaorouji/openwrt-passwall" >> feeds.conf.default
echo -e "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default
echo -e "src-git OpenAppFilter https://github.com/destan19/OpenAppFilter" >> feeds.conf.default
##echo -e "src-git OpenClash https://github.com/vernesong/OpenClash.git;dev" >> feeds.conf.default
echo -e "src-git jerryk https://github.com/jerrykuku/openwrt-package" >> feeds.conf.default

svn checkout  https://github.com/vernesong/OpenClash/branches/dev/luci-app-openclash ./package/lean/luci-app-openclash

