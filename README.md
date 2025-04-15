# BART Installation Guide

This README provides instructions to install and compile `BART` from the source code. Follow the steps below to set up and build the project.

## Prerequisites

- Ensure that `conda` is available (instructions on the [Miniconda](https://docs.conda.io/en/latest/miniconda.html) or [Anaconda](https://www.anaconda.com/))

- Requires CUDA **Driver** >= 12.3 (run `nvidia-smi` and then you should see `CUDA Version: 12.3` (or higher) in the output)

### Why is the CUDA driver required?
The CUDA driver is critical for running CUDA-enabled programs because it:

- Handles communication between the GPU and the operating system: The driver acts as the intermediary between your GPU hardware and the system.
- Enables execution of CUDA programs: Even if you have the CUDA Toolkit installed, any program using CUDA APIs must rely on the driver to send instructions to the GPU.
- Ensures compatibility: NVIDIA GPU drivers are generally backward-compatible with older versions of the CUDA Toolkit. However, using a driver version that is older than the required CUDA version will result in compatibility issues.

---

## Installation Steps

1. **Install Conda**

If `conda` is not already installed on your machine:
- Download and install Miniconda or Anaconda from their respective websites.
- Follow the installation instructions for your operating system.

Once installed, verify the installation by running:
```bash
conda --version
```
   
2. Clone the Repository Use git to clone the repository to your local machine:

```bash
git clone https://github.com/ShanghaiTech-Hu-Lab/bart-installer.git
cd bart-installer
```

3. Build the Project Run the make command to compile the project:

```bash
make
```

This will compile the source code and build the BART binary.

4. Verify Compilation If the compilation is successful, the BART binary will be available under the ./bart/ and ./usr/ directory:

```bash
ls ./bart/
ls ./usr/
```

You should see the BART executable file "bart" in this directory.
