#!/bin/bash


rm -rf clang-tmp

./build-llvm.py \
	--build-stage1-only \
	--install-stage1-only \
	--projects "clang;lld;polly" \
	--targets "ARM;AArch64;X86" \
	--install-folder "clang-tmp" \
	--clang-vendor "AE86-$(date +%Y%m%d)" 


#rm -rf binutils-tmp

#./build-binutils.py \
#	--targets arm aarch64 \
#	--install-folder "binutils-tmp"




