# BART Installation Guide

[![bart](https://img.shields.io/badge/-bart-gray?logo=github)](https://github.com/mrirecon/bart)

This guide helps you compile `BART` using the conda environment.

If you are interested in `BART`, please visit: [https://github.com/mrirecon/bart](https://github.com/mrirecon/bart)

## Prepare

- Ensure that `conda` is available (instructions on the [Miniconda](https://docs.conda.io/en/latest/miniconda.html) or [Anaconda](https://www.anaconda.com/))

- Requires CUDA **Driver** >= 12.3 (run `nvidia-smi` and then you should see `CUDA Version: 12.3` (or higher) in the output)

## Install

```bash
git clone https://github.com/ShanghaiTech-Hu-Lab/bart-installer.git
cd bart-installer
make
```
**Note** that this script creates a conda environment named `bart_installer`, make sure that name **is NOT USED**.


