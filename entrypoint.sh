#!/bin/bash
set -e

source /opt/ros/humble/setup.bash

cd /home/orb/ORB_SLAM3
if [ -d "/home/orb/ORB_SLAM3/build" ]; then
   echo "/home/orb/ORB_SLAM3/build exists."
else
    ./build.sh
fi
#check if that directory exists
cd /root/colcon_ws
if [ -d "/root/colcon_ws/install" ]; then
   echo "Directory /root/colcon_ws/install exists."
else
    colcon build --symlink-install && source install/setup.bash
fi

source /root/.bashrc

ros2 launch orb_slam3_ros2_wrapper rgbd.launch.py &

/bin/bash

exec "$@"