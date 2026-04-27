### Running Steps for R2S


```bash
# Terminal 1
cd $YOUR_ROS_WS/src/FAST-LIVO2/launch
roslaunch mapping_mid360.launch

# Terminal 2
rosbag play YOUR_ROS_BAGFILE
```

The results with pointcloud are saved under `LOG/` dir.


