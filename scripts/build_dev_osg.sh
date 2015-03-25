OSG_SOURCE_PATH=~/dev/skfb/osg/
docker run -v ${OSG_SOURCE_PATH}:${OSG_SOURCE_PATH} -v $(pwd):/tools -e BASE="${OSG_SOURCE_PATH}" -t sketchfab/processing3d /bin/bash /tools/scripts/compile_osg.sh
