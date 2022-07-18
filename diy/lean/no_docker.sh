#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================

## 移除docker套件
sed -i 's/CONFIG_PACKAGE_luci-app-dockerman=y/# CONFIG_PACKAGE_luci-app-dockerman is not set/g' .config
sed -i 's/CONFIG_PACKAGE_docker=y/# CONFIG_PACKAGE_docker is not set/g' .config
sed -i 's/CONFIG_PACKAGE_dockerd=y/# CONFIG_PACKAGE_dockerd is not set/g' .config
sed -i 's/CONFIG_DOCKER_CGROUP_OPTIONS=y/# CONFIG_DOCKER_CGROUP_OPTIONS is not set/g' .config
sed -i 's/CONFIG_PACKAGE_docker-compose=y/# CONFIG_PACKAGE_docker-compose is not set/g' .config
sed -i 's/CONFIG_PACKAGE_containerd=y/# CONFIG_PACKAGE_containerd is not set/g' .config
sed -i 's/CONFIG_PACKAGE_runc=y/# CONFIG_PACKAGE_runc is not set/g' .config
sed -i 's/CONFIG_PACKAGE_libnetwork=y/# CONFIG_PACKAGE_libnetwork is not set/g' .config
sed -i 's/CONFIG_PACKAGE_tini=y/# CONFIG_PACKAGE_tini is not set/g' .config

sed -i '/# CONFIG_PACKAGE_luci-i18n-dockerman-zh-cn  is not set/d' .config
sed -i '/CONFIG_PACKAGE_luci-i18n-dockerman-zh-cn=y/d' .config
sed -i '/# CONFIG_PACKAGE_luci-i18n-dockerman-zh_Hans is not set/d' .config
sed -i '/CONFIG_PACKAGE_luci-i18n-dockerman-zh_Hans=y/d' .config

