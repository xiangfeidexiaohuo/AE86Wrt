#### LEDE-Lean

#### 软路由/红米AX6/斐讯K3 OpenWrt固件

* 基于[Lean源码](https://github.com/coolsnowwolf/lede)

* 默认管理：192.168.2.1  密码：password

* 默认主题：Argon

* [下载固件](https://github.com/xiangfeidexiaohuo/OpenWrt_Build/releases)

#### x86_64软路由刷机：

* 用工具(balenaEtcher等)直接将固件写入软路由硬盘


#### 斐讯K3刷机：

* 在OpenWrt/LEDE系统，不保留配置刷此固件

* 其他系统，建议刷tb的官root固件，用SSH工具，刷入OpenWrt/LEDE后，不保留配置，刷此固件


#### 红米AX6刷机：

* 解锁SSH [解锁教程](https://qust.me/post/hong-mi-ax6-jie-suo-ssh-an-zhuang-shi-yong-shellclash-jiao-cheng/)

* 根据此 [AX6刷第三方openwrt固件](https://www.right.com.cn/forum/thread-4111331-1-1.html)，执行到第五步

* 使用WinSCP登录AX6，把ubi后缀的固件(比如:AX6-OpenWrt-Lean-5.10-squashfs-nand-factory-20211112_YaoDao.ubi)传到路由器tmp目录

SSH执行以下几条令：
```
ubiformat /dev/mtd13 -y -f /tmp/AX6-OpenWrt-Lean-5.10-squashfs-nand-factory-20211112_YaoDao.ubi

fw_setenv flag_last_success 1

fw_setenv flag_boot_rootfs 1
```
然后重启路由器，即可享受OpenWrt！

* 以后更新固件，直接WEB更新bin后缀的固件(比如:AX6-OpenWrt-Lean-5.10-squashfs-nand-sysupgrade-20211112_YaoDao.bin)

* 若在其他作者可WEB更新的OpenWrt固件，直接不保留配置刷入bin后缀的固件






