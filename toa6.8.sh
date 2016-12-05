#!/usr/bin/env bash
yum install -y rpm-build rpmdevtools
rpmdev-setuptree

rpm -ivh http://vault.centos.org/centos/6//updates/Source/SPackages/kernel-2.6.32-642.11.1.el6.src.rpm
cd ~/rpmbuild/SOURCES
tar -jxvf linux-2.6.32-642.11.1.el6.tar.bz2

wget https://raw.githubusercontent.com/xiaomatech/toa.patch/master/centos6.8-toa.patch
cd linux-2.6.32-642.11.1.el6
patch -p1 < ~/rpmbuild/SOURCES/centos6.8-toa.patch
cd ~/rpmbuild/SOURCES
tar -cjvf linux-2.6.32-642.11.1.el6.tar.bz2 linux-2.6.32-642.11.1.el6

rpmbuild -bb ~/rpmbuild/SPECS/kernel.spec
ls -alt ~/rpmbuild/RPMS/x86_64/