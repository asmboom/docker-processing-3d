FROM ubuntu:14.04.1

MAINTAINER trigrou

RUN apt-get -y update && apt-get -y install ccache \
  cmake \
  p7zip-full \
  freeglut3-dev \
  ccache \
  git \
  g++ \
  libjpeg-dev libtiff5-dev libpng12-dev \
  blender \
  python \
  wget \
  software-properties-common \
  python-software-properties

RUN add-apt-repository ppa:thomas-schiex/blender

RUN mkdir ~/.ssh/
COPY id_rsa /root/.ssh/

RUN echo "/usr/local/lib64/" >/etc/ld.so.conf.d/lib64.conf
RUN echo "/usr/local/lib/" >/etc/ld.so.conf.d/lib.conf

ENV LD_LIBRARY_PATH /usr/local/lib/:/usr/local/lib64/:

RUN mkdir -p /sketchfab/tools/
RUN mkdir -p /usr/local/lib64/

RUN mkdir /root/fbx && cd /root/fbx && wget http://images.autodesk.com/adsk/files/fbx20142_1_fbxsdk_linux.tar.gz
RUN cd /root/fbx && tar xvfz fbx20142_1_fbxsdk_linux.tar.gz && chmod +x fbx20142_1_fbxsdk_linux
RUN cd /root/fbx && eval 'echo -e "y\nyes\nyes" | ./fbx20142_1_fbxsdk_linux ./'
RUN cp /root/fbx/lib/gcc4/x64/release/* /usr/local/lib64/

RUN cd /root/ && git clone /data/osg
RUN mkdir -p /root/osg/build
RUN cd /root/osg/build && FBX_DIR=/root/fbx/ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER="ccache" -DCMAKE_CXX_COMPILER_ARG1="g++" ../
RUN cd /root/osg/build && make -j7 install

RUN cd /sketchfab/tools/ && git clone git@github.com:sketchfab/osgexport.git


RUN rm -r /root/fbx/ /root/osg/
