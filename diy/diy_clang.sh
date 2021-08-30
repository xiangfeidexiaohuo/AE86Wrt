#!/bin/bash

###
###
rm -rf clang-tmp

./build-llvm.py \
	--update \
	--update-llvm \
	--update-binutils \
	--build-stage1-only \
	--install-stage1-only \
	--projects "clang;lld;polly" \
	--targets "ARM;AArch64;X86" \
	--install-folder "clang-tmp" \
	--clang-vendor "AE86-$(date +%Y%m%d)" \
	--additional-build-arguments "CLANG_REPOSITORY_STRING=https://github.com/xiangfeidexiaohuo" 



###
###
rm -rf binutils-tmp
sed -i '/if (bfd_link_pic (info) && (sec->flags & SEC_ALLOC) != 0)/,+22d'  ./binutils/bfd/elfnn-aarch64.c
./build-binutils.py \
	--targets arm aarch64 \
	--install-folder "binutils-tmp"




