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

##
rm -rf ./feeds/2305ipk/patch/luci-app-turboacc
rm -rf ./package/feeds/2305ipk/luci-app-turboacc


##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

##更改主机名
sed -i "s/hostname='.*'/hostname='AE86Wrt'/g" package/base-files/files/bin/config_generate

##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='AE86Wrt-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By DaoDao'/g" package/base-files/files/etc/openwrt_release
cp -af feeds/2305ipk/patch/diy/banner  package/base-files/files/etc/banner

sed -i "2iuci set istore.istore.channel='ae86_daodao'" package/base-files/files/bin/config_generate
sed -i "3iuci commit istore" package/base-files/files/bin/config_generate

##Immortalwrt
sed -i "2iuci set istore.istore.channel='ae86_daodao'" package/emortal/default-settings/files/99-default-settings
sed -i "3iuci commit istore" package/emortal/default-settings/files/99-default-settings


##
sed -i "53iLUCI_LANG.zh-cn=\$(LUCI_LANG.zh_Hans)" feeds/luci/luci.mk
sed -i "54iLUCI_LANG.zh-tw=\$(LUCI_LANG.zh_Hant)" feeds/luci/luci.mk


##MosDNS
# rm -rf feeds/packages/net/mosdns/*
# cp -af feeds/2305ipk/op-mosdns/mosdns/* feeds/packages/net/mosdns/
rm -rf feeds/packages/net/v2ray-geodata/*
cp -af feeds/2305ipk/op-mosdns/v2ray-geodata/* feeds/packages/net/v2ray-geodata/

##Dockerman
rm -rf feeds/luci/applications/luci-app-dockerman/*
cp -af feeds/2305ipk/luci-app-dockerman/* feeds/luci/applications/luci-app-dockerman/

## fix_ss_libv
rm -rf package/libs/mbedtls
rm -rf package/libs/uclient
rm -rf package/libs/ustream-ssl
cp -af feeds/2305ipk/patch/fix_ss_libv/*  package/libs/

## golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

## rust(ci false)
sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile
