# BART Installation Guide

This README provides instructions to install and compile `BART` from the source code. Follow the steps below to set up and build the project.

## Prerequisites

Before proceeding, ensure that you have `conda` installed on your system. If you don't have it yet, you can install it by following the instructions on the [Miniconda](https://docs.conda.io/en/latest/miniconda.html) or [Anaconda](https://www.anaconda.com/) website.

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
git clone git@github.com:ShanghaiTech-Hu-Lab/bart-guide.git
cd bart-guide
```

3. Build the Project Run the make command to compile the project:

```bash
make
```

This will compile the source code and build the BART binary.

4. Verify Compilation If the compilation is successful, the BART binary will be available under the ./bart/ directory:

```bash
ls ./bart/
```

You should see the BART executable file "bart" in this directory.
