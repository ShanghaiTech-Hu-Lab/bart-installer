# BART Installation Guide

[![bart](https://img.shields.io/badge/-bart-gray?logo=github)](https://github.com/mrirecon/bart)

This guide helps you compile `BART` using the conda environment.

If you are interested in `BART`, please visit: [https://github.com/mrirecon/bart](https://github.com/mrirecon/bart)

## Prepare

- Ensure that `conda` is available (instructions on the [Miniconda](https://docs.conda.io/en/latest/miniconda.html) or [Anaconda](https://www.anaconda.com/))

- Requires CUDA **Driver** >= 12.3 (run `nvidia-smi` and then you should see `CUDA Version: 12.3` (or higher) in the output)

- Make sure mpicc is available, and **gcc11** is used as the default compiler.

## Install

```bash
git clone https://github.com/ShanghaiTech-Hu-Lab/bart-installer.git
cd bart-installer
make
```
**Note** that this script creates a conda environment named `bart_installer`, make sure that name **is NOT USED**.

After the compilation is complete, the `bart-installer/bart/` directory will be generated. You can move it to any location where you want to install it.

Once you have decided on the location, you need to set the `BART_TOOLBOX_PATH` environment variable to the path of `bart-installer/bart/`. It is recommended to modify the environment variable in your `.bashrc` file to ensure it is available in every shell session. 

In addition, if you want to use bart in the command line (e.g. `$ bart pics`), make sure that the `PATH` includes the path where `bart-installer/bart/bart`(executable  file) is located.
