#!/bin/bash
#
# Created by MCV
#

version="4.5.1"
folder="workspace"

echo "** Install requirement!"
sudo apt-get update
sudo apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp
sudo apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y python2.7-dev python3.6-dev python-dev python-numpy python3-numpy
sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
sudo apt-get install libcanberra-gtk-module libcanberra-gtk3-module
sudo apt-get install -y curl


echo "** Download opencv-"${version}
mkdir $folder
cd ${folder}
curl -L https://github.com/opencv/opencv/archive/${version}.zip -o opencv-${version}.zip
curl -L https://github.com/opencv/opencv_contrib/archive/${version}.zip -o opencv_contrib-${version}.zip
unzip opencv-${version}.zip
unzip opencv_contrib-${version}.zip
cd opencv-${version}/



echo "** Building..."
mkdir build
cd build/
cmake -D WITH_CUDA=ON -D WITH_CUDNN=ON -D OPENCV_DNN_CUDA=ON -D CUDNN_INCLUDE_DIR=/usr/local/cuda-11.5/include -D CUDNN_LIBRARY=/usr/local/cuda-11.5/lib64/libcudnn.so.8.3.0 -D WITH_CUBLAS=1 -D CUDA_ARCH_BIN="7.5" -D CUDA_ARCH_PTX="" -D CUDA_FAST_MATH=1 -D ENABLE_FAST_MATH=1 -D OPENCV_GENERATE_PKGCONFIG=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${version}/modules -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python2=ON -D BUILD_opencv_python3=ON -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j$(nproc)
sudo make install


echo "** Has been installed opencv-"${version}" "
echo "** Congratulations"
