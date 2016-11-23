### toa.patch
source https://github.com/alibaba/ali_kernel_rpm/blob/6u/patches.taobao/toa.patch

alibaba toa patch in centos 7.2


#使用方法
#下载centos官方src.rpm
rpm -ivh http://vault.centos.org/centos/7.2.1511/updates/Source/SPackages/kernel-3.10.0-327.36.3.el7.src.rpm
xz -d linux-3.10.0-327.36.3.el7.tar.xz
tar -xvf linux-3.10.0-327.36.3.el7.tar
#toa打patch
wget https://raw.githubusercontent.com/xiaomatech/toa.patch/master/toa.patch
patch -p1 < ~/toa.patch

#重新编译rpm
rpmbuild -bb ~/rpmbuild/SPECS/kernel.spec
ll ~/rpmbuild/RPMS/x86_64/
