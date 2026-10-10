#!/bin/bash
#=================================================
# DaoDao's script (TL-7DR7299 post-feeds, 移植自 huladabang/openwrt-7dr7299)
#=================================================

##OpenClash LuCI 插件
rm -rf package/luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git /tmp/OpenClash
cp -a /tmp/OpenClash/luci-app-openclash package/luci-app-openclash

##内嵌 arm64 Mihomo/Meta 内核，刷机后 OpenClash 即可直接使用
mkdir -p package/luci-app-openclash/root/etc/openclash/core
curl --fail --location --retry 3 \
  https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz \
  -o /tmp/openclash-core.tar.gz
tar -xzf /tmp/openclash-core.tar.gz -C /tmp
install -m 0755 /tmp/clash package/luci-app-openclash/root/etc/openclash/core/clash_meta

##从上游 LuCI 添加轻量文件管理器
rm -rf package/luci-app-filemanager /tmp/luci-upstream
git clone --depth=1 https://github.com/openwrt/luci.git /tmp/luci-upstream
cp -a /tmp/luci-upstream/applications/luci-app-filemanager package/luci-app-filemanager

##TL-7DR7299 界面显示 MT7988A (Cortex-A73) 1.8GHz 主频
sed -i '/"mediatek"\/\*|"mvebu"\/\*)/i "mediatek/filogic_a73")\n\tcpu_freq="1.8GHz" ;;' \
  package/emortal/autocore/files/generic/cpuinfo

##DaoDao 通用美化与标识（与其它 AE86Wrt 固件保持一致）
bash ../diy/mt798x/imm2.sh
