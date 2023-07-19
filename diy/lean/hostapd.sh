#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================

##wpad-basic编译失败(AX6000/T7)
  
sed -i '/TARGET_LDFLAGS += -lubox -lubus/i\TARGET_CFLAGS += -ffunction-sections -fdata-sections -flto' package/network/services/hostapd/Makefile
sed -i '/TARGET_LDFLAGS += -lubox -lubus/i\TARGET_LDFLAGS += -Wl,--gc-sections -flto=jobserver -fuse-linker-plugin' package/network/services/hostapd/Makefile

