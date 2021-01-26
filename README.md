# Cross Compile For Raspberry Pi

This works for all versions of the Pi up to the 4.


# Get the files

1. Clone this repo: `https://github.com/ab3lson/raspberry-pi-cross-compiler.git`
2. Download the Toolchain: `wget https://github.com/Pro/raspi-toolchain/releases/latest/download/raspi-toolchain.tar.gz`
3. Extract the toolchain: `sudo tar xfz raspi-toolchain.tar.gz --strip-components=1 -C /opt`


# Get Your Libraries

1. Create a folder in your home directory called rpi and put a rootfs folder inside: `mkdir -p ~/rpi/rootfs`
2. Copy your Pi's root filesystem with rsync to get all of its libraries (replace the IP with your Pi's IP): `rsync -vR --progress -rl --delete-after --safe-links pi@192.168.IP.ADDR:/{lib,usr,opt/vc/lib} ~/rpi/rootfs`

# Install Dependencies

1. `sudo apt install cmake`

# Cross Compile

1. Create a project folder for your C code
2. Save code inside of the project folder
3.  Create a file called CMakeLists.txt inside of the project folder
4. Create CMake file (using file in hello_world as a template)
5. Run `rpi_cross_compile.sh`
6. If your code compiled successfully, it will be found inside the newly created `build` folder
