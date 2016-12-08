#!/usr/bin/env bash
yum install -y rpm-build rpmdevtools yum-utils rng-tools
rpmdev-setuptree

rpm -ivh http://vault.centos.org/centos/6//updates/Source/SPackages/kernel-2.6.32-642.11.1.el6.src.rpm
cd ~/rpmbuild/SOURCES
tar -jxvf linux-2.6.32-642.11.1.el6.tar.bz2

wget https://raw.githubusercontent.com/xiaomatech/toa/master/centos6.8-toa.patch
cd linux-2.6.32-642.11.1.el6
patch -p1 < ~/rpmbuild/SOURCES/centos6.8-toa.patch
cd ~/rpmbuild/SOURCES
tar -cjvf linux-2.6.32-642.11.1.el6.tar.bz2 linux-2.6.32-642.11.1.el6

sed -i 's/# % define buildid .local/%define buildid .toa/g' ~/rpmbuild/SPECS/kernel.spec
sudo spectool -g ~/rpmbuild/SPECS/kernel.spec
sudo yum-builddep -y ~/rpmbuild/SPECS/kernel.spec
rpmbuild -bb --without kabichk --without debuginfo ~/rpmbuild/SPECS/kernel.spec
echo 'build the toa kernel rpm list'
echo ''
ls -alt ~/rpmbuild/RPMS/x86_64/
echo ''
echo 'every realserver should install ~/rpmbuild/RPMS/x86_64/kernel-2.6.32-642.11.1.el6.toa.x86_64.rpm'
echo ''
echo 'after install ,reboot realserver'
echo ''