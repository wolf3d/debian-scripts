# based on https://github.com/milq/scripts-ubuntu-debian

apt-get -y update
apt-get -y autoremove

# INSTALL THE DEPENDENCIES

# Build tools:
apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config

# Media I/O:
apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
apt-get install -y libtbb-dev libeigen3-dev libtbb2

# Python:
apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
#apt-get install -y ant default-jdk

# Documentation:
#apt-get install -y doxygen

git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON ..
make -j7
make install
ldconfig
