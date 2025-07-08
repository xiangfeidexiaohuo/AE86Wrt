#!/bin/bash
#=================================================
# DaoDao's script
#=================================================             

## fix_ss_libv
rm -rf package/libs/mbedtls
rm -rf package/libs/uclient
rm -rf package/libs/ustream-ssl
cp -af feeds/2305ipk/patch/fix_ss_libv/*  package/libs/

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
