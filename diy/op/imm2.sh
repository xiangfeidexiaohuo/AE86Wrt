#!/bin/bash
#=================================================
# DaoDao's script
#=================================================             

####
echo -e "\nmsgid \"Control\"" >> feeds/luci/modules/luci-base/po/zh_Hans/base.po
echo -e "msgstr \"控制\"" >> feeds/luci/modules/luci-base/po/zh_Hans/base.po

echo -e "\nmsgid \"NAS\"" >> feeds/luci/modules/luci-base/po/zh_Hans/base.po
echo -e "msgstr \"网络存储\"" >> feeds/luci/modules/luci-base/po/zh_Hans/base.po

echo -e "\nmsgid \"VPN\"" >> feeds/luci/modules/luci-base/po/zh_Hans/base.po
echo -e "msgstr \"魔法网络\"" >> feeds/luci/modules/luci-base/po/zh_Hans/base.po

##配置IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

##更改主机名
sed -i "s/hostname='.*'/hostname='AE86Wrt'/g" package/base-files/files/bin/config_generate

##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='AE86Wrt-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By DaoDao'/g" package/base-files/files/etc/openwrt_release
sed -i "s/OPENWRT_RELEASE=\"*.*\"/OPENWRT_RELEASE=\"AE86Wrt-$(date +%Y%m%d) By DaoDao\"/g" package/base-files/files/usr/lib/os-release

cp -af feeds/2305ipk/patch/diy/banner  package/base-files/files/etc/banner

sed -i "2iuci set istore.istore.channel='ae86_daodao'" package/base-files/files/bin/config_generate
sed -i "3iuci commit istore" package/base-files/files/bin/config_generate

##Immortalwrt
sed -i "2iuci set istore.istore.channel='ae86_daodao'" package/emortal/default-settings/files/99-default-settings
sed -i "3iuci commit istore" package/emortal/default-settings/files/99-default-settings

##
sed -i "s/DISTRIB_ID='*.*'/DISTRIB_ID='AE86Wrt'/g" package/base-files/files/etc/openwrt_release
date '+%Y%m%d%H' > package/base-files/files/etc/openwrt_version
sed -i "s/NAME=\"*.*\"/NAME=\"AE86Wrt\"/g" package/base-files/files/usr/lib/os-release
sed -i "s/BUILD_ID=\"*.*\"/BUILD_ID=\"$(date +%Y%m%d) By DaoDao\"/g" package/base-files/files/usr/lib/os-release

##
sed -i "53iLUCI_LANG.zh-cn=\$(LUCI_LANG.zh_Hans)" feeds/luci/luci.mk
sed -i "54iLUCI_LANG.zh-tw=\$(LUCI_LANG.zh_Hant)" feeds/luci/luci.mk


##MosDNS
rm -rf feeds/packages/net/v2ray-geodata/*
cp -af feeds/2305ipk/op-mosdns/v2ray-geodata/* feeds/packages/net/v2ray-geodata/

##antiblock
rm -rf feeds/luci/applications/luci-app-antiblock/*
cp -af feeds/2305ipk/op-antiblock/luci-app-antiblock/* feeds/luci/applications/luci-app-antiblock/

##Dockerman
rm -rf feeds/luci/applications/luci-app-dockerman/*
cp -af feeds/2305ipk/luci-app-dockerman/* feeds/luci/applications/luci-app-dockerman/

## golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang
