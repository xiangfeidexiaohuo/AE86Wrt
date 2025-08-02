#!/bin/bash
#=================================================
# DaoDao's script
#=================================================             

##信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='%D %V - $(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' - DaoDao'/g" package/base-files/files/etc/openwrt_release

## fix_ss_libv
rm -rf package/libs/mbedtls
rm -rf package/libs/uclient
rm -rf package/libs/ustream-ssl
cp -af feeds/2305ipk/patch/fix_ss_libv/*  package/libs/

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

## rust(ci false)
sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile
