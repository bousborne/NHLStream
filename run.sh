#! /bin/bash

IMAGE_NAME="nhlstream-deploy"

image_exists ()
{
	docker image inspect $IMAGE_NAME > /dev/null
	return
}
build_image ()
{
        pushd $(dirname $(realpath -s $0))
	docker build docker -t $IMAGE_NAME
        popd
}

image_exists

if [ $? -ne 0 ]; then
	echo "Docker image '$IMAGE_NAME' not found, attempting to build image..."
	build_image
	if [ $? -ne 0 ]; then
		echo "Image build failed.  Sorry, giving up"
		exit -1
	fi
fi

if [[ -t 1 ]]; then
    IT="-i"
fi
if [[ -t 0 ]]; then
    IT="$IT -t"
fi

P3CSIDIR=$(dirname $PWD)
echo "P3CSIDIR = $P3CSIDIR"
SCRIPTDIR=$(dirname $(readlink -f $0))
cd deploy/
echo "$PWD"
cd Ubuntu/
echo "$PWD"
#cd ../../
OVFDIR=$(dirname $(readlink -f $0))
echo "OVFDIR = $OVFDIR"
cd ../../
#cd -
cd configs
CONFIGSDIR=$(dirname $(readlink -f $0))
echo "CONFIGSDIR = $CONFIGSDIR"
#cd ../installs && cd -
cd -
cd installs
INSTALLSDIR=$(dirname $(readlink -f $0))
echo "INSTALLSDIR = $INSTALLSDIR"
cd -
#OVFDIR=$(dirname $(readlink -f $0))
#echo "OVFDIR = $OVFDIR"
cd $P3CSIDIR
cd NHLStream
echo "Starting container image '$IMAGE_NAME'"
docker run --rm -v $SCRIPTDIR:/deploy -v $CONFIGSDIR:/configs -v $INSTALLSDIR:/installs -v $OVFDIR:/ubun -v /etc/localtime:/etc/localtime:ro $IT $IMAGE_NAME 
