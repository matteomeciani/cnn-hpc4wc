LOGS    = logs
SCRIPTS = scripts

.PHONY: help submit-pytorch clean logs

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "  submit-pytorch   Submit GPU job to Slurm (Santis)"
	@echo "  logs         Tail the latest log file"
	@echo "  clean        Remove saved models and logs"

submit-pytorch:
	mkdir -p $(LOGS)
	sbatch $(SCRIPTS)/submit_pytorch.sh

logs:
	tail -f $(LOGS)/$$(ls -t $(LOGS)/ | head -1)

clean:
	rm -f $(LOGS)/* model-fold-*.pth