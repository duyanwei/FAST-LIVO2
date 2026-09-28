xhost +local:docker

docker run -it \
  --gpus all \
  --net=host \
  --privileged \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /home/lzhao360/Documents/real2sim2real:/root/real2sim2real \
  fastlivo2:noetic
