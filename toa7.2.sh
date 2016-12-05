#!/usr/bin/env bash
yum install -y rpm-build rpmdevtools
rpmdev-setuptree

rpm -ivh http://vault.centos.org/centos/7.2.1511/updates/Source/SPackages/kernel-3.10.0-327.36.3.el7.src.rpm
cd ~/rpmbuild/SOURCES
xz -d linux-3.10.0-327.36.3.el7.tar.xz
tar -xvf linux-3.10.0-327.36.3.el7.tar

wget https://raw.githubusercontent.com/xiaomatech/toa.patch/master/centos7.2-toa.patch
cd linux-3.10.0-327.36.3.el7
patch -p1 < centos7.2-toa.patch
tar cvf linux-3.10.0-327.36.3.el7.tar linux-3.10.0-327.36.3.el7
xz -z linux-3.10.0-327.36.3.el7.tar

rpmbuild -bb ~/rpmbuild/SPECS/kernel.spec
ls -alt ~/rpmbuild/RPMS/x86_64/