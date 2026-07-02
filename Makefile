# =============================================================================
# CNN Forward Pass — C++ vs PyTorch Numerical Verification
# HPC4WC Course, ETH Zürich 2026
# =============================================================================

# -----------------------------------------------------------------------------
# Terminal colors (ANSI escape codes)
# -----------------------------------------------------------------------------
C_RESET       := \033[0m
C_BOLD        := \033[1m
C_RED         := \033[31m
C_GREEN       := \033[32m
C_YELLOW      := \033[33m
C_CYAN        := \033[36m
C_BOLD_GREEN  := \033[1;32m
C_BOLD_CYAN   := \033[1;36m
C_BOLD_YELLOW := \033[1;33m

# -----------------------------------------------------------------------------
# Compiler & flags
# -----------------------------------------------------------------------------
CXX      := g++
CXXFLAGS := -std=c++17 -O3 -march=native -Wall -Wextra -Wpedantic
PYTHON   := python3

# Debug build:     make DEBUG=1 build
ifdef DEBUG
  CXXFLAGS := -std=c++17 -O0 -g -fsanitize=address,undefined -Wall -Wextra
endif

# ASCII art image:  make PRINT_ASCII=1 build
ifdef PRINT_ASCII
  CXXFLAGS += -DPRINT_ASCII
endif

# Training device: make train DEVICE=cpu  (default: cuda)
DEVICE ?= cuda

# -----------------------------------------------------------------------------
# Directory layout
# -----------------------------------------------------------------------------
BUILD_DIR := build
SRC_CPP   := src/cpp
HEADERS   := $(SRC_CPP)/include
SRC_PY    := src/python
LOGS_DIR  := logs
SCRIPTS   := scripts

# -----------------------------------------------------------------------------
# Sources & binary
# -----------------------------------------------------------------------------
CPP_SRCS := $(SRC_CPP)/main.cpp $(SRC_CPP)/cnn_internals.cpp
CPP_HDRS := $(HEADERS)/cnn_internals.h $(HEADERS)/timing.h
TARGET   := $(BUILD_DIR)/cnn_forward

# -----------------------------------------------------------------------------
# Phony declarations
# -----------------------------------------------------------------------------
.PHONY: help all build run verify train \
        run-local verify-local train-local all-local \
        logs clean _check_slurm

.DEFAULT_GOAL := help

# -----------------------------------------------------------------------------
# Help
# -----------------------------------------------------------------------------
help:
	@printf '\n$(C_BOLD)CNN HPC4WC — available targets$(C_RESET)\n\n'
	@printf '$(C_BOLD)Cluster (sbatch):$(C_RESET)\n'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'run'             'Submit C++ build + forward pass to Slurm'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'verify'          'Submit C++ build + run + Python verifier to Slurm'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'train'           'Submit GPU training job to Slurm'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'all'             'Submit run + verify + train to Slurm'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'logs'            'Tail the latest Slurm log file'
	@printf '\n$(C_BOLD)Local (login node):$(C_RESET)\n'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'build'           'Compile the C++ forward-pass binary'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'run-local'       'Execute the C++ forward pass directly'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'verify-local'    'Run the Python/PyTorch verifier directly'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'train-local'     'Run PyTorch training directly (DEVICE=cuda|cpu)'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'all-local'       'build → run-local → verify-local'
	@printf '\n'
	@printf '  $(C_CYAN)%-22s$(C_RESET) %s\n' 'clean'           'Remove build artefacts, logs, and checkpoints'
	@printf '\n$(C_BOLD)Overrides:$(C_RESET)\n'
	@printf '  $(C_YELLOW)%-22s$(C_RESET) %s\n' 'DEBUG=1'        'Build with -O0 -g -fsanitize=address,undefined'
	@printf '  $(C_YELLOW)%-22s$(C_RESET) %s\n' 'PRINT_ASCII=1'  'Enable ASCII art image print in C++ binary'
	@printf '  $(C_YELLOW)%-22s$(C_RESET) %s\n' 'DEVICE=cpu'     'Use CPU for training (default: cuda)'
	@printf '\n'

# -----------------------------------------------------------------------------
# Build
# -----------------------------------------------------------------------------
$(TARGET): $(CPP_SRCS) $(CPP_HDRS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -I$(SRC_CPP) -o $@ $(CPP_SRCS)
	@printf '$(C_BOLD_GREEN)Build successful:$(C_RESET) $@\n'

build: $(TARGET)

# -----------------------------------------------------------------------------
# Local targets (login-node / quick dev testing)
# The binary uses paths relative to src/cpp/; verify.py relative to src/python/.
# -----------------------------------------------------------------------------
run-local: $(TARGET)
	@printf '$(C_BOLD_CYAN)--- C++ Forward Pass (local) ---$(C_RESET)\n'
	cd $(SRC_CPP) && ../../$(TARGET)

verify-local:
	@printf '$(C_BOLD_CYAN)--- Python/PyTorch Verifier (local) ---$(C_RESET)\n'
	cd $(SRC_PY) && $(PYTHON) verify.py

train-local:
	@printf '$(C_BOLD_CYAN)--- PyTorch Training (local, device=$(DEVICE)) ---$(C_RESET)\n'
	cd $(SRC_PY) && $(PYTHON) -u train.py --device $(DEVICE)

all-local: build run-local verify-local

# -----------------------------------------------------------------------------
# Slurm — primary targets; fail fast outside a cluster
# -----------------------------------------------------------------------------
_check_slurm:
	@command -v sbatch >/dev/null 2>&1 || \
		{ printf '$(C_RED)Error:$(C_RESET) sbatch not found — this target requires a Slurm cluster.\n'; exit 1; }

run: _check_slurm
	@mkdir -p $(LOGS_DIR)
	@sbatch $(SCRIPTS)/submit_run.sh

verify: _check_slurm
	@mkdir -p $(LOGS_DIR)
	@sbatch $(SCRIPTS)/submit_verify.sh

train: _check_slurm
	@mkdir -p $(LOGS_DIR)
	@sbatch $(SCRIPTS)/submit_pytorch.sh

all: run verify train

logs:
	@if [ -z "$$(ls -A $(LOGS_DIR)/ 2>/dev/null)" ]; then \
		printf '$(C_YELLOW)No log files yet in $(LOGS_DIR)/$(C_RESET)\n'; \
	else \
		tail -f $(LOGS_DIR)/$$(ls -t $(LOGS_DIR)/ | head -1); \
	fi

# -----------------------------------------------------------------------------
# Clean  (preserves build/.gitkeep)
# -----------------------------------------------------------------------------
clean:
	rm -f $(TARGET)
	rm -f $(LOGS_DIR)/*
	rm -f $(SRC_PY)/model-fold-*.pth
	@printf '$(C_GREEN)Clean complete.$(C_RESET)\n'
