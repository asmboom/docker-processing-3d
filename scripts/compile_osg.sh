cd $BASE && mkdir -p build-docker
cd build-docker

export CCACHE_DIR=$BASE/.ccache
export CC="ccache gcc"
export CXX="ccache g++"

#rm CMakeCache.txt
FBX_DIR=/root/fbx/ cmake -DCMAKE_BUILD_TYPE=Debug  -DOSG_USE_REF_PTR_IMPLICIT_OUTPUT_CONVERSION=OFF ../

make -j7 install
