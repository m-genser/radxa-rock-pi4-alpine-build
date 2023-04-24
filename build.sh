# Get Generic Linux Kernel ARM GCC Cross Compiler
wget -c https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz
tar xf gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz
export CC=`pwd`/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/bin/aarch64-linux-gnu-

# Get Trusted ARM Firmware
git clone https://github.com/ARM-software/arm-trusted-firmware --depth=1
cd arm-trusted-firmware/

# Configure the Build
make CROSS_COMPILE=${CC} realclean
make CROSS_COMPILE=${CC} PLAT=rk3399

export BL31=`pwd`/build/rk3399/release/bl31/bl31.elf

cd ..

# Get U-Boot
git clone -b v2020.04-rc1 https://github.com/u-boot/u-boot --depth=1
cd u-boot/

# Configure the Build
make ARCH=arm CROSS_COMPILE=${CC} distclean
make ARCH=arm CROSS_COMPILE=${CC} rock-pi-4-rk3399_defconfig
make ARCH=arm CROSS_COMPILE=${CC}

cd ..

# Get Linux Kernel
git clone https://github.com/RobertCNelson/rockchip-linux-dev ./kernelbuildscripts
cd kernelbuildscripts/

git checkout origin/v5.4.x -b tmp

./build_kernel.sh