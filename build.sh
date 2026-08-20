#!/bin/bash
# Activate virtual environment and render the resume
source .venv/bin/activate
echo "🚀 Rendering resume..."
echo ""
python -m rendercv render src/resume.yaml
echo "✨ Resume successfully compiled to output/"
