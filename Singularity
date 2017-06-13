BootStrap: debootstrap
OSVersion: xenial
MirrorURL: http://archive.ubuntu.com/ubuntu/


%setup

	echo "##### Installing Development Tools YUM group #####"
	apt-get -y install apt-utils 
        apt-get -y install build-essential wget git binutils binutils-dev cmake gcc g++ gfortran bzip2  xz-utils liblzma-dev make libcurl4-openssl-dev libreadline-dev libpcre3-dev libbz2-dev zlib1g-dev

%post
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
