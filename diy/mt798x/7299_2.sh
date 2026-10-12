#!/bin/bash
#=================================================
# DaoDao's script (TL-7DR7299 post-feeds, 移植自 huladabang/openwrt-7dr7299)
#=================================================

##内嵌 arm64 Mihomo/Meta 内核
mkdir -p feeds/2305ipk/patch/wall-luci/luci-app-openclash/root/etc/openclash/core
curl -fL --retry 3 https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz -o /tmp/openclash-core.tar.gz && tar -xzf /tmp/openclash-core.tar.gz -C /tmp && install -m 0755 /tmp/clash feeds/2305ipk/patch/wall-luci/luci-app-openclash/root/etc/openclash/core/clash_meta

##从上游 LuCI 添加轻量文件管理器
rm -rf package/luci-app-filemanager /tmp/luci-upstream
git clone --depth=1 https://github.com/openwrt/luci.git /tmp/luci-upstream
cp -a /tmp/luci-upstream/applications/luci-app-filemanager package/luci-app-filemanager

##TL-7DR7299 界面显示 MT7988A (Cortex-A73) 1.8GHz 主频
sed -i '/"mediatek"\/\*|"mvebu"\/\*)/i "mediatek/filogic_a73")\n\tcpu_freq="1.8GHz" ;;' \
  package/emortal/autocore/files/generic/cpuinfo

##DaoDao 通用
bash ../diy/mt798x/imm2.sh

##tailscale 改用 packages 源的 1.80.3
rm -rf feeds/2305ipk/op-tailscale/tailscale package/feeds/2305ipk/tailscale
make -s prepare-mk OPENWRT_BUILD= TMP_DIR="$PWD/feeds/2305ipk.tmp"
make -s -f include/scan.mk IS_TTY=1 SCAN_TARGET="packageinfo" SCAN_DIR="feeds/2305ipk" \
  SCAN_NAME="package" SCAN_DEPTH=5 SCAN_EXTRA="" TMP_DIR="$PWD/feeds/2305ipk.tmp"
./scripts/feeds install tailscale
