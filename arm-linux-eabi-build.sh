#!/bin/bash

if [ $1 == "Msys2" ]
	then
	export OUT_PREFIX=/d/work/projects/sip/freeswitch
	elif [ $1 == "Linux" ]
	then
	export OUT_PREFIX=~/home/work/projects/sip/freeswitch
	else
	echo "Must be Msys2 or Linux"
fi

./bootstrap.sh

./configure \
	--host=arm-linux-gnueabihf \
	--prefix=$OUT_PREFIX/ArmLinuxEABI-hf \
	--exec-prefix=$OUT_PREFIX/ArmLinuxEABI-hf/bin \
	ac_cv_file__dev_ptmx=yes config_TARGET_READLINE_INC=" " \
	ac_cv_file__dev_zero=yes ac_cv_func_setpgrp_void=yes apr_cv_tcp_nodelay_with_cork=yes \
	ac_cv_file_dbd_apr_dbd_mysql_c=no ac_cv_va_copy=yes  \
	ac_cv_file__dev_urandom=yes \
	--disable-core-libedit-support \
	CC=$ARMLINUXEABI/bin/arm-linux-gnueabihf-gcc \
	CXX=$ARMLINUXEABI/bin/arm-linux-gnueabihf-g++ \
	LDFLAGS=-L$ARMLINUXEABI/arm-linux-gnueabihf/lib \
	CPPFLAGS=-I$ARMLINUXEABI/arm-linux-gnueabihf/include/c++/4.9.1
