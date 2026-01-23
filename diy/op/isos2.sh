#!/bin/bash
#=================================================
# DaoDao's script
#=================================================             

##信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='%D %V 3rd - $(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' - DaoDao'/g" package/base-files/files/etc/openwrt_release
sed -i "s/OPENWRT_RELEASE=\"*.*\"/OPENWRT_RELEASE=\"%D %V 3rd - $(date +%Y%m%d) - DaoDao\"/g" package/base-files/files/usr/lib/os-release
sed -i "s/BUILD_ID=\"*.*\"/BUILD_ID=\"$(date +%Y%m%d) By DaoDao\"/g" package/base-files/files/usr/lib/os-release

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang

## rust
rm -rf feeds/packages/lang/rust && git clone https://github.com/xiangfeidexiaohuo/extra-others && mv extra-others/rust feeds/packages/lang/

