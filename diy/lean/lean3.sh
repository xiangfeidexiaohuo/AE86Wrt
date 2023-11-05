#!/bin/bash
#=================================================
# DaoDao's script
#=================================================


#补充汉化
echo -e "\nmsgid \"Control\"" >> feeds/luci/modules/luci-base/po/zh-cn/base.po
echo -e "msgstr \"控制\"" >> feeds/luci/modules/luci-base/po/zh-cn/base.po

echo -e "\nmsgid \"NAS\"" >> feeds/luci/modules/luci-base/po/zh-cn/base.po
echo -e "msgstr \"网络存储\"" >> feeds/luci/modules/luci-base/po/zh-cn/base.po


##补充汉化       
echo -e "\nmsgid \"General\"" >> package/feeds/luci/luci-app-dnsforwarder/po/zh-cn/dnsforwarder.po
echo -e "msgstr \"常规\"" >> package/feeds/luci/luci-app-dnsforwarder/po/zh-cn/dnsforwarder.po

echo -e "\nmsgid \"LOG\"" >> package/feeds/luci/luci-app-dnsforwarder/po/zh-cn/dnsforwarder.po
echo -e "msgstr \"日志\"" >> package/feeds/luci/luci-app-dnsforwarder/po/zh-cn/dnsforwarder.po

              
##配置ip等
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm-k3|TARGET_DEVICES += phicomm-k3| ; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
sed -i 's/192.168.1.1/192.168.188.254/g' package/base-files/files/bin/config_generate

##清除默认密码password
sed -i '/V4UetPzk$CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings


##替换K3无线驱动为69027
rm -rf ./package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
svn export https://github.com/xiangfeidexiaohuo/Phicomm-K3_Wireless-Firmware/trunk/brcmfmac4366c-pcie.bin_69027 ./package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin


##取消bootstrap为默认主题
rm -rf ./feeds/extraipk/theme/luci-theme-argon
rm -rf ./feeds/extraipk/theme/luci-app-argon-config
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/themes/luci-theme-design
rm -rf ./feeds/luci/themes/luci-theme-argon-mod

rm -rf ./package/feeds/extraipk/luci-theme-argon
rm -rf ./package/feeds/extraipk/luci-app-argon-config
rm -rf ./package/feeds/luci/luci-theme-argon
rm -rf ./package/feeds/luci/luci-theme-design
rm -rf ./package/feeds/luci/luci-theme-argon-mod

sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-design/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-design/g' feeds/luci/collections/luci-nginx/Makefile


##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='Routes.Live R2023'/g" package/lean/default-settings/files/zzz-default-settings   
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' $(date +%Y%m%d)'/g" package/lean/default-settings/files/zzz-default-settings
cp -af feeds/extraipk/patch/diy/banner-diy  package/base-files/files/etc/banner

sed -i "2iuci set istore.istore.channel='ae86_daodao'" package/lean/default-settings/files/zzz-default-settings
sed -i "3iuci commit istore" package/lean/default-settings/files/zzz-default-settings

##更改主机名
sed -i "s/hostname='.*'/hostname='Routes.Live'/g" package/base-files/files/bin/config_generate

##WiFi
sed -i "s/OpenWrt/Routes.Live/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i "s/encryption=.*/encryption=sae-mixed\nset wireless.default_radio\${devidx}.key=Routes.Live/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

sed -i "/ae86_openwrt_chat/d" package/feeds/extraipk/autocore/files/arm/index.htm

### fix speed
sed -i "s/speed = <2500>;/speed = <1000>;/g" target/linux/mediatek/dts/mt7622-*.dts
sed -i "s/speed = <2500>;/speed = <1000>;/g" target/linux/mediatek/dts/mt7623a-*.dts
sed -i "s/speed = <2500>;/speed = <1000>;/g" target/linux/mediatek/dts/mt7981b-*.dts
sed -i "s/speed = <2500>;/speed = <1000>;/g" target/linux/mediatek/dts/mt7986a-*.dts
sed -i "s/speed = <2500>;/speed = <1000>;/g" target/linux/mediatek/dts/mt7622-*.dtsi
sed -i "s/speed = <2500>;/speed = <1000>;/g" target/linux/mediatek/dts/mt7623a-*.dtsi

##FQ全部调到VPN菜单
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm

sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/passwall/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/view/passwall/socks_auto_switch/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall/luasrc/view/passwall/server/*.htm

sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/passwall2/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/model/cbi/passwall2/client/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/model/cbi/passwall2/server/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/app_update/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/socks_auto_switch/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/global/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/haproxy/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/log/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/node_list/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/rule/*.htm
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/server/*.htm

sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-vssr/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-vssr/luasrc/view/vssr/*.htm

sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-openclash/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-openclash/luasrc/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-openclash/luasrc/model/cbi/openclash/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-openclash/luasrc/view/openclash/*.htm

sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-bypass/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-bypass/luasrc/model/cbi/bypass/*.lua
sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-bypass/luasrc/view/bypass/*.htm

##
sed -i '/option Interface/d'  package/network/services/dropbear/files/dropbear.config


## rockchip
cp -af feeds/extraipk/patch/rockchip/*  target/linux/rockchip/armv8/base-files/


