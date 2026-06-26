LOGS    = logs
SCRIPTS = scripts

.PHONY: help submit-cpu submit-gpu clean logs

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "  submit-cpu   Submit CPU job to Slurm (Santis)"
	@echo "  submit-gpu   Submit GPU job to Slurm (Santis)"
	@echo "  logs         Tail the latest log file"
	@echo "  clean        Remove saved models and logs"

submit-cpu:
	mkdir -p $(LOGS)
	sbatch $(SCRIPTS)/submit_pytorch_cpu.sh

submit-gpu:
	mkdir -p $(LOGS)
	sbatch $(SCRIPTS)/submit_pytorch_gpu.sh

logs:
	tail -f $(LOGS)/$$(ls -t $(LOGS)/ | head -1)

clean:
	rm -f $(LOGS)/* model-fold-*.pth