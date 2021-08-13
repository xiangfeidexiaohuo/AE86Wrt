#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================
##添加自己的插件库
rm -rf ./package/lean/luci-app-syncdial
rm -rf ./package/diy/luci-app-adguardhome
rm -rf ./package/diy/OpenAppFilter
rm -rf ./package/diy/luci-app-dockerman
rm -rf ./package/diy/luci-lib-docker
#
rm -rf ./package/lean/luci-theme-argon
git clone -b master --depth 1 https://github.com/jerrykuku/luci-theme-argon.git ./package/lean/luci-theme-argon
#
rm -rf ./package/lean/luci-app-qbittorrent
rm -rf ./package/lean/qBittorrent
rm -rf ./package/lean/libtorrent-rasterbar
rm -rf ./package/lean/qt5
               
echo -e "\nsrc-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages" >> feeds.conf.default
echo -e "src-git nas https://github.com/linkease/nas-packages.git;master" >> feeds.conf.default
echo -e "src-git passwall https://github.com/xiaorouji/openwrt-passwall" >> feeds.conf.default
echo -e "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default
echo -e "src-git OpenAppFilter https://github.com/destan19/OpenAppFilter" >> feeds.conf.default
echo -e "src-git OpenClash https://github.com/vernesong/OpenClash" >> feeds.conf.default
echo -e "src-git jerryk https://github.com/jerrykuku/openwrt-package" >> feeds.conf.default


