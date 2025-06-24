# MiAM Robotics MilkV

```
docker build -t milkv .
echo "alias milkv_docker=\"xhost +local:docker && docker run --privileged --rm -e DISPLAY=\$DISPLAY -v ~/.ssh:/root/ssh_source:ro -v ~/.config/milk_docker:/root/commandhistory:rw -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/${USER}/milkv_workspace/:/milkv_workspace:Z -it milkv\"" >> ~/.bashrc
source ~/.bashrc
```