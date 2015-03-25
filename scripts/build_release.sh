echo 'build processing release'
cat docker-templates/Dockerfile.system docker-templates/Dockerfile.release >Dockerfile
docker build -t sketchfab/processing3d .
