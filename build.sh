#!/bin/bash
source .venv/bin/activate

echo "🚀 Compiling all targeted resumes..."
echo ""

HAS_ERROR=0

# Loop through all yaml files in src/
for file in src/*.yaml; do
    echo "Building $file..."
    # If the command fails, it triggers the || condition instead of crashing
    python -m rendercv render "$file" || {
        echo "❌ Render failed for $file"
        HAS_ERROR=1
    }
done

# Create the public distribution folder
mkdir -p resumes

# Copy all successfully generated PDFs
cp output/*/*.pdf resumes/ 2>/dev/null || true

# Alert and exit with failure code if any single build failed
if [ $HAS_ERROR -eq 1 ]; then
    echo "⚠️ Finished with some errors. Successful PDFs were still moved to resumes/."
    exit 1
else
    echo "✨ All done! Check the resumes/ folder for your final PDFs."
fi
