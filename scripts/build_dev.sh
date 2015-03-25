echo 'build osg develop'
cp docker-templates/Dockerfile.system Dockerfile
docker build -t sketchfab/processing3d-system .

cp docker-templates/Dockerfile.develop Dockerfile
docker build -t sketchfab/processing3d .
