exit
ros2 launch kalman_bringup navigation.launch.py use_sim_time:=true slam:=True
ros2 launch kalman_gazebo world.launch.py
ros2 param set /kalman_0 lidar.scan.freq.target 7.0
ros2 launch kalman_bringup navigation.launch.py map:=$HOME/maps/map.yaml
ros2 run nav2_map_server map_saver_cli -f ~/maps/map --ros-args -p save_map_timeout:=60.0
ros2 launch explore_lite explore.launch.py
ros2 launch kalman_bringup navigation.launch.py slam:=True
ros2 launch kalman_bringup monitor_robot.launch.py
ros2 run kalman_teleop teleop_keyboard
ros2 launch kalman_bringup physical.launch.py
