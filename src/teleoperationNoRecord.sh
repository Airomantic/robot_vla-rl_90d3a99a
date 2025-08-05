#!/bin/bash

python -m lerobot.teleoperate \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM2 \
    --robot.calibration_dir=/home/jiang/tianyi/code/lerobot_90d3a99a/utilData/calibration/robots/so101_follower \
    --robot.id=calib_right_follower_arm \
    --robot.cameras="{top: {type: opencv, index_or_path: 4, width: 1280, height: 720, fps: 5}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM1 \
    --teleop.calibration_dir=/home/jiang/tianyi/code/lerobot_90d3a99a/utilData/calibration/teleoperators/so101_leader \
    --teleop.id=calib_right_leader_arm \
    --display_data=false

: <<EOF

--robot.cameras="{top: {type: opencv, index_or_path: 4, width: 1280, height: 720, fps: 5}, laptop: {type: opencv, index_or_path: 0, width: 640, height: 480, fps: 15}}" \

# 校准
python -m lerobot.calibrate     --robot.type=so101_follower     --robot.port=/dev/ttyACM2     --robot.id=my_awesome_follower_arm

python -m lerobot.calibrate \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM1 \
    --teleop.id=my_awesome_leader_arm 

cp -r ~/.cache/huggingface/lerobot/calibration /home/qing/tianyi/code/lerobot_519b76110e/utilData
 
python -m lerobot.teleoperate \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM2 \
    --robot.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/robots/so101_follower \
    --robot.id=my_awesome_follower_arm \
    --robot.cameras="{top: {type: opencv, index_or_path: 4, width: 1280, height: 720, fps: 15}, laptop: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 15}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM1 \
    --teleop.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/teleoperators/so101_leader \
    --teleop.id=my_awesome_leader_arm \
    --display_data=true


"program": "${workspaceFolder}/src/lerobot/teleoperate.py",
"args": [       
    "--robot.type=so101_follower",
    "--robot.port=/dev/ttyACM2",
    "--robot.id=calibration_follower_arm",
    "--robot.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/robots/so101_follower",
    "--robot.cameras={top: {type: opencv, index_or_path: 4, width: 1280, height: 800, fps: 15}, laptop: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 15}}",
    "--teleop.type=so101_leader",
    "--teleop.port=/dev/ttyACM0",
    "--teleop.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/teleoperators/so101_leader",
    "--teleop.id=calibration_leader_arm",
    "--display_data=true"
],

EOF