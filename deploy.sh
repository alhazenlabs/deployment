DOCKER_APT_PACKAGE="docker.io"
IMAGE_NAME="docker.io/alhazenlabs/deployment:v1"
CONTAINER_NAME="alhazenlabs-deployment"
PORT="8081"

if [ $(dpkg-query -W -f='${Status}' $DOCKER_APT_PACKAGE 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo "Installation of docker wasn't found installing docker..."
    sudo apt-get update
    sudo apt install $DOCKER_APT_PACKAGE
    sudo groupadd docker
    sudo usermod -aG docker $USER
else
    echo "Installation of docker found skipping installation"
fi

echo "stopping the existing container: $CONTAINER_NAME"
docker rm -f $CONTAINER_NAME
echo "starting a new container: $CONTAINER_NAME"
docker run --name $CONTAINER_NAME -p 80:8081 -p 443:8081 -d $IMAGE_NAME
