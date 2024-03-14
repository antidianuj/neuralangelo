# Neuralangelo
This is the fork of the official repo of [**Neuralangelo**](https://github.com/NVlabs/neuralangelo), with intent for quick and easy processing of lego buildozer dataset, with following steps:

## 1. Setting up Environment
**Platform:** Ubuntu-22
```bash
git clone https://github.com/antidianuj/neuralangelo.git
cd neuralangelo
conda env create --file neuralangelo.yaml
conda activate neuralangelo

# seting up colmap (if colmap is already installed then copy the directory of colmap repo to directory of neuralangelo).
# Otherwise proceed as follows (for colmap stuff)
git clone https://github.com/colmap/colmap
cd colmap
sudo apt-get install \
    git \
    cmake \
    ninja-build \
    build-essential \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-system-dev \
    libeigen3-dev \
    libflann-dev \
    libfreeimage-dev \
    libmetis-dev \
    libgoogle-glog-dev \
    libgtest-dev \
    libsqlite3-dev \
    libglew-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libcgal-dev \
    libceres-dev

sudo apt-get install -y \
    nvidia-cuda-toolkit \
    nvidia-cuda-toolkit-gcc
git clone https://github.com/colmap/colmap.git
cd colmap
mkdir build
cd build
cmake .. -GNinja
ninja
sudo ninja install
cd ..
```


## 2. Dataset Preparation (Lego Bulldozer)
```bash
chmod +x data_prepare.sh
./data_prepare.sh
```

## 3. Running Neuralangelo Training Session
The hyperaprameters for Neuralangelo training are adjusted in '/projects/neuralangelo/configs/base.yaml'.
The recommended 'max_epochs' by authors is 500000 in 'base.yaml'. The checkpoints are stored with frequency defined by 'save_iter' in `base.yaml'.

Afterwards, the training is performed as follows
```bash
chmod +x neuryangelo.sh
./neuryangelo.sh
```

## 4. Inference from Neuralangelo Trained Checkpoints for Extracting Isosurfaces as Meshes (3D representation of Lego bulldozer)
```bash
chmod +x isosurfacer.sh
./isosurfacer.sh
```
The resolution of the meshes can be adjusted in `isosurfacer.sh'

The corresponding meshes are stored as .ply files in `/logs/example_group/example_name'. These .ply files can be quickly viewed online on [3dviewer](https://3dviewer.net/) or [point](https://point.love/)
