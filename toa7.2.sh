#!/usr/bin/env bash
yum install -y rpm-build rpmdevtools
rpmdev-setuptree

rpm -ivh http://vault.centos.org/centos/7.2.1511/updates/Source/SPackages/kernel-3.10.0-327.36.3.el7.src.rpm
cd ~/rpmbuild/SOURCES
xz -d linux-3.10.0-327.36.3.el7.tar.xz
tar -xvf linux-3.10.0-327.36.3.el7.tar

wget https://raw.githubusercontent.com/xiaomatech/toa.patch/master/centos7.2-toa.patch
cd linux-3.10.0-327.36.3.el7
patch -p1 < ~/rpmbuild/SOURCES/centos7.2-toa.patch

cd ~/rpmbuild/SOURCES
tar cvf linux-3.10.0-327.36.3.el7.tar linux-3.10.0-327.36.3.el7
xz -z linux-3.10.0-327.36.3.el7.tar

sed -i 's/# % define buildid .local/%define buildid .toa/g' ~/rpmbuild/SPECS/kernel.spec
rpmbuild -bb ~/rpmbuild/SPECS/kernel.spec
echo 'build the toa kernel rpm list \n'
ls -alt ~/rpmbuild/RPMS/x86_64/
echo 'every realserver is to install ~/rpmbuild/RPMS/x86_64/kernel-3.10.0-327.36.3.el7.toa.x86_64.rpm \n'
echo 'after install ,reboot realserver \n'