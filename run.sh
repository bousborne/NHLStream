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

PREROOTDIR=$(dirname $PWD)
echo "PREROOTDIR = $PREROOTDIR"
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
#cd installs
NHLSTREAMDIR=$(dirname $(readlink -f $0))
echo "NHLSTREAMDIR = $NHLSTREAMDIR"
cd -
#OVFDIR=$(dirname $(readlink -f $0))
#echo "OVFDIR = $OVFDIR"
#cd $NHLSTREAMDIR
#echo $(dirname $(readlink -f $0))
#cd NHLStream
echo "Starting container image '$IMAGE_NAME'"
docker run --rm -v $NHLSTREAMDIR:/NHLStream -v /etc/localtime:/etc/localtime:ro $IT $IMAGE_NAME
#docker run --rm -v $SCRIPTDIR:/deploy -v $NHLSTREAMDIR:/NHLStream -v /etc/localtime:/etc/localtime:ro $IT $IMAGE_NAME
