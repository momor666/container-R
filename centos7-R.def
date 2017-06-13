BootStrap: yum
OSVersion: 7
MirrorURL: https://www.mirrorservice.org/sites/mirror.centos.org/%{OSVERSION}/os/$basearch/
UpdateURL: https://www.mirrorservice.org/sites/mirror.centos.org/%{OSVERSION}/updates/$basearch/
Include: yum

%post

	echo "##### Installing Development Tools YUM group #####"
	yum -y groupinstall "Development Tools"
	yum install -y wget git binutils binutils-devel cmake gcc gcc-gfortran gcc-c++ libgfortran readline readline-devel bzip2 bzip2-devel xz xz-libs lzma xz-devel xz-lzma-compat pcre pcre-devel libcurl libcurl-devel make

	echo "##### getting the R code #####"

	mkdir /tmp/R-tmp
	cd /tmp/R-tmp
	wget https://cran.r-project.org/src/base/R-latest.tar.gz
	tar zxf R-latest.tar.gz
	cd R-*
	./configure --enable-R-shlib --with-x=no
	make
	make install


%runscript
	echo "##### Loading R #####"
	exec R 
