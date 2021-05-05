#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================
##添加自己的插件库
rm -rf ./package/lean/k3screenctrl
rm -rf ./package/lean/luci-app-sfe
rm -rf ./package/lean/luci-app-syncdial
rm -rf ./package/diy/luci-app-adguardhome
rm -rf ./package/diy/OpenAppFilter
               
echo -e "\nsrc-git xiangfeidexiaohuo https://github.com/xiangfeidexiaohuo/openwrt-packages" >> feeds.conf.default
echo -e "src-git nas https://github.com/linkease/nas-packages.git;master" >> feeds.conf.default
echo -e "src-git passwall https://github.com/xiaorouji/openwrt-passwall" >> feeds.conf.default
echo -e "src-git helloworld https://github.com/fw876/helloworld" >> feeds.conf.default
echo -e "src-git OpenAppFilter https://github.com/destan19/OpenAppFilter" >> feeds.conf.default
echo -e "src-git OpenClash https://github.com/vernesong/OpenClash" >> feeds.conf.default

rm -rf ./package/yaodao
##dnsfilter
git clone -b main --depth 1 https://github.com/garypang13/luci-app-dnsfilter.git ./package/yaodao/luci-app-dnsfilter

##jerrykuku
git clone -b master --depth 1 https://github.com/jerrykuku/luci-theme-argon.git ./package/yaodao/luci-theme-argon
git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git ./package/yaodao/luci-app-argon-config
git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-vssr.git ./package/yaodao/luci-app-vssr
git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-jd-dailybonus.git ./package/yaodao/luci-app-jd-dailybonus
#git clone -b master --depth 1 https://github.com/jerrykuku/lua-maxminddb.git ./package/yaodao/lua-maxminddb
