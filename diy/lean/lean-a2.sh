#!/bin/bash
#=================================================
# DaoDao's script
#=================================================


#补充汉化
echo -e "\nmsgid \"Control\"" >> feeds/luci/modules/luci-base/po/zh-cn/base.po
echo -e "msgstr \"控制\"" >> feeds/luci/modules/luci-base/po/zh-cn/base.po

echo -e "\nmsgid \"NAS\"" >> feeds/luci/modules/luci-base/po/zh-cn/base.po
echo -e "msgstr \"网络存储\"" >> feeds/luci/modules/luci-base/po/zh-cn/base.po

echo -e "\nmsgid \"VPN\"" >> feeds/luci/modules/luci-base/po/zh-cn/base.po
echo -e "msgstr \"魔法网络\"" >> feeds/luci/modules/luci-base/po/zh-cn/base.po

##补充汉化
echo -e "\nmsgid \"General\"" >> package/feeds/luci/luci-app-dnsforwarder/po/zh-cn/dnsforwarder.po
echo -e "msgstr \"常规\"" >> package/feeds/luci/luci-app-dnsforwarder/po/zh-cn/dnsforwarder.po

echo -e "\nmsgid \"LOG\"" >> package/feeds/luci/luci-app-dnsforwarder/po/zh-cn/dnsforwarder.po
echo -e "msgstr \"日志\"" >> package/feeds/luci/luci-app-dnsforwarder/po/zh-cn/dnsforwarder.po

              
##配置ip等
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm-k3|TARGET_DEVICES += phicomm-k3| ; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

##清除默认密码password
sed -i '/V4UetPzk$CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings


##替换K3无线驱动为69027
cp -af feeds/extraipk/patch/brcmfmac4366c-pcie.bin ./package/lean/k3-firmware/files/brcmfmac4366c-pcie.bin


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
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci-nginx/Makefile


##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='Tiger-$(date +%Y%m%d)'/g" package/lean/default-settings/files/zzz-default-settings   
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By Aaron'/g" package/lean/default-settings/files/zzz-default-settings
cp -af feeds/extraipk/patch/diy/banner-a  package/base-files/files/etc/banner

sed -i "2iuci set istore.istore.channel='ae86_daodao'" package/lean/default-settings/files/zzz-default-settings
sed -i "3iuci commit istore" package/lean/default-settings/files/zzz-default-settings


##更改主机名
sed -i "s/hostname='.*'/hostname='Tiger'/g" package/base-files/files/bin/config_generate

##WiFi
sed -i "s/LEDE/Tiger/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

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
cp -af feeds/extraipk/patch/opkg  target/linux/rockchip/armv8/base-files/etc/

## golang 为 1.23.x
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
