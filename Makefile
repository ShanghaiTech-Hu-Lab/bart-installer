# Global config
SHELL := /bin/bash

WORK_DIR := $(shell pwd)
MAKEFILE_PATH := $(WORK_DIR)/Makefile_template
INSTALL_DIR := $(WORK_DIR)
ENV_YAML_PATH := $(WORK_DIR)/environment.yaml
SRC_URL := https://github.com/mrirecon/bart/archive/refs/tags/v0.9.00.tar.gz
SRC_FILE_NAME := bart.tar.gz
SRC_OUTPUT_DIR := bart
CONDA_ENV := bart_installer
CONDA_ACTIVATE = source $(shell conda info --base)/etc/profile.d/conda.sh && conda activate $(CONDA_ENV)

# Targets
.PHONY: all create_env link_sources download_source build clean

all: create_env link_sources download_source build

create_env:
	@if ! conda env list | grep -w "^$(CONDA_ENV)$$" > /dev/null; then \
		echo "Creating Conda environment $(CONDA_ENV)..."; \
		conda env create -f $(ENV_YAML_PATH) -n bart_installer; \
		. "$(shell conda info --base)/etc/profile.d/conda.sh" && conda activate $(CONDA_ENV); \
		if [ $$? -ne 0 ]; then \
			echo "Failed to activate the Conda environment."; \
			exit 1; \
		fi; \
	else \
		echo "Conda environment $(CONDA_ENV) already exists. Skipping creation."; \
	fi

link_sources:
	@$(CONDA_ACTIVATE) && \
	CONDA_ENV_PATH=$$(conda info --json | grep -Po '"active_prefix":.*?"\K[^"]+' | head -n 1) && \
	TARGET_DIR=$${CONDA_ENV_PATH}/targets/x86_64-linux/include && \
	INCLUDE_DIR=$${CONDA_ENV_PATH}/include && \
	SRC_DIR=/usr/lib/x86_64-linux-gnu/ && \
	DEST_DIR=$${CONDA_ENV_PATH}/lib && \
	echo "Linking include and lib directories..." && \
	for file in $${TARGET_DIR}/*; do \
	  filename=$$(basename $$file); \
	  target=$${INCLUDE_DIR}/$$filename; \
	  if [ ! -e "$$target" ]; then \
	    ln -s "$$file" "$$target"; \
	  fi; \
	done && \
	for file in $${SRC_DIR}/*; do \
	  filename=$$(basename $$file); \
	  dest=$${DEST_DIR}/$$filename; \
	  if [ ! -e "$$dest" ]; then \
	    ln -s "$$file" "$$dest"; \
	  fi; \
	done

download_source:
	@if [ ! -d $(SRC_OUTPUT_DIR) ]; then \
	    echo "Directory '$(SRC_OUTPUT_DIR)' does not exist. Downloading source code $(SRC_URL)..."; \
	    curl -L $(SRC_URL) -o $(SRC_FILE_NAME); \
	    if [ $$? -ne 0 ]; then \
	        echo "Failed to download source code!"; \
	        exit 1; \
	    fi; \
	    echo "Downloaded source code finished."; \
	    echo "Extracting source code..."; \
	    mkdir -p $(SRC_OUTPUT_DIR); \
	    tar -xzf $(SRC_FILE_NAME) -C $(SRC_OUTPUT_DIR) --strip-components=1; \
	    if [ $$? -ne 0 ]; then \
	        echo "Extraction failed!"; \
	        exit 1; \
	    fi; \
	    echo "Extraction completed. Files are in $(SRC_OUTPUT_DIR)."; \
	else \
	    echo "Directory '$(SRC_OUTPUT_DIR)' already exists. Skipping download."; \
	fi

build:
	@echo "Building source code..."
	cp $(MAKEFILE_PATH) $(SRC_OUTPUT_DIR)/Makefile
	@$(CONDA_ACTIVATE) &&\
	cd $(SRC_OUTPUT_DIR) && \
	export CONDA_ENV_PATH=$$(conda info --json | grep -Po '"active_prefix":.*?"\K[^"]+' | head -n 1) && \
	export INSTALL_DIR=$(INSTALL_DIR) && \
	make && \
	make install

clean:
	@echo "Cleaning up..."
	@rm -f $(SRC_FILE_NAME)
	@conda deactivate
	@conda env remove -n bart_installer