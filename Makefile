LOGS       = logs
SCRIPTS    = scripts
PYTHON_DIR = src/python

.PHONY: help submit-pytorch clean logs

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "  submit-pytorch   Submit GPU job to Slurm (Santis)"
	@echo "  logs             Tail the latest log file"
	@echo "  clean            Remove saved models and logs"

submit-pytorch:
	mkdir -p $(LOGS)
	sbatch $(SCRIPTS)/submit_pytorch.sh

logs:
	@if [ -z "$$(ls -A $(LOGS)/ 2>/dev/null)" ]; then \
		echo "No log files yet in $(LOGS)/"; \
	else \
		tail -f $(LOGS)/$$(ls -t $(LOGS)/ | head -1); \
	fi

clean:
	rm -f $(LOGS)/*
	rm -f $(PYTHON_DIR)/model-fold-*.pth
	rm -f $(PYTHON_DIR)/weights_cpp/*.pth