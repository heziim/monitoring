# for  centos7
sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-rhel7.repo

# for centos8
# sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-rhel8.repo

sudo dnf clean expire-cache && sudo dnf install -y datacenter-gpu-manager

sudo systemctl --now enable nvidia-dcgm

docker run -d --gpus all --rm -p 9400:9400 nvcr.io/nvidia/k8s/dcgm-exporter:2.1.8-2.4.0-rc.3-ubuntu18.04
