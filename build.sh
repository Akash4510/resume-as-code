#!/bin/bash
# Activate the virtual environment
source .venv/bin/activate

# Pass all command line arguments directly to run.py
python run.py "$@"
