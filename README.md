# GMS: Grid-based Motion Statistics for Fast, Ultra-robust Feature Correspondence

![alt tag](http://mmcheng.net/wp-content/uploads/2017/03/dog_ours.jpg)

## Install on Ubuntu 20.04
1. `chmod +x install_opencv4.5.1_gpu.sh`
2. `./install_opencv4.5.1_gpu.sh` check your paths : **CUDNN_INCLUDE_DIR** and **CUDNN_LIBRARY**
3. `cmake Cmakelits.txt`
4. `sudo make`
5. `./gms_match_demo`

## Results:

- on CPU
  - Get total 1050 matches.
  - Time taken by function: **231285** microseconds

- on GPU :
  - Get total 1054 matches. 
  - Time taken by function: **149061** microseconds