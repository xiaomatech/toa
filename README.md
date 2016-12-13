### toa.patch
        source https://github.com/alibaba/ali_kernel_rpm/blob/6u/patches.taobao/toa.patch

        alibaba toa patch in centos 6.8/7.2


# build
    centos 6.8 : curl https://raw.githubusercontent.com/xiaomatech/toa/master/toa6.8.sh | bash
    
    centos 7.2 : curl https://raw.githubusercontent.com/xiaomatech/toa/master/toa7.2.sh | bash 

# install 
    rpm -ivh kernel*.rpm

# use
    因为toa模块改动比较大,导致不容易升级内核,而它的用处是获取前面的接入层fullnat(https://github.com/xiaomatech/lvs)过来的真实ip, 所以一般建议toa用来做再需要真实ip的地方(比如web层)就好了.
    原来的架构可能是fullnat->nginx(toa)->app
    推荐的架构fullnat->nginx(toa)->nginx->app
    toa专门一层的意义是把不容易升级内核的这个统一集中在这里 这样对其它的系统影响最小
