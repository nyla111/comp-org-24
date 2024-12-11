# Computer Organization Fall'24 
## Lab 6: From C to RISC-V Assembly

Required Setup:
- For Windows- Install WSL2 (Windows Subsystem for Linux): Follow Microsoft's guide to install Linux distribution and WSL2
- After installing Linux distribution and WSL2, you should update with: sudo apt-get update and sudo apt-get upgrade
- Install RISC-V GNU toolchain: run the following commands:
  
  • sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev
libslirp-dev

  • git clone https://github.com/riscv/riscv-gnu-toolchain
  
  • cd riscv-gnu-toolchain
  
  • ./configure --prefix=/opt/riscv --with-arch=rv32gc --with-abi=ilp32d
  
  • sudo make
  
  • export PATH="$PATH:/opt/riscv/bin"
- Install QEMU Emulation for RISCV32: sudo apt install qemu-user
