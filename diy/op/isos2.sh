#!/bin/bash
#=================================================
# DaoDao's script
#=================================================             

##信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='%D %V 3rd - $(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' - DaoDao'/g" package/base-files/files/etc/openwrt_release
sed -i "s/OPENWRT_RELEASE=\"*.*\"/OPENWRT_RELEASE=\"%D %V 3rd - $(date +%Y%m%d) - DaoDao\"/g" package/base-files/files/usr/lib/os-release
sed -i "s/BUILD_ID=\"*.*\"/BUILD_ID=\"$(date +%Y%m%d) By DaoDao\"/g" package/base-files/files/usr/lib/os-release

## fix_ss_libv
rm -rf package/libs/mbedtls
rm -rf package/libs/uclient
rm -rf package/libs/ustream-ssl
cp -af feeds/2305ipk/patch/fix_ss_libv/*  package/libs/

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

## rust(ci false)
# sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile
# --build-dir $(HOST_BUILD_DIR)/build \
# --ci false \
sed -i 's/--build-dir\ $(HOST_BUILD_DIR)\/build/--build-dir\ $(HOST_BUILD_DIR)\/build\ \\\n\		--ci\ false/' feeds/packages/lang/rust/Makefile

