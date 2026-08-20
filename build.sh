#!/bin/bash
source .venv/bin/activate

echo "🚀 Compiling all targeted resumes..."
echo ""

HAS_ERROR=0

# Loop through all yaml files in src/
for file in src/resume*.yaml; do
    echo "Building $file..."
    # If the command fails, it triggers the || condition instead of crashing
    python -m rendercv render "$file" || {
        echo "❌ Render failed for $file"
        HAS_ERROR=1
    }
done

# Alert and exit with failure code if any single build failed
if [ $HAS_ERROR -eq 1 ]; then
    echo "⚠️ Finished with some errors, check the logs above."
    echo "Successful PDFs were still moved to output/."
    exit 1
else
    echo "✨ Local build complete! Previews are available in the output/ folder."
fi
