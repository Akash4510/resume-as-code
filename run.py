import subprocess
import sys
import glob
import os
import shutil


def main():
    print("🚀 Compiling all targeted resumes...\n")

    yaml_files = glob.glob("src/*.yaml")
    if not yaml_files:
        print("❌ No YAML files found in src/")
        sys.exit(1)

    has_error = False

    # Loop through all files; do NOT exit on failure
    for file in yaml_files:
        print(f"Building {file}...")
        result = subprocess.run(
            [sys.executable, "-m", "rendercv", "render", file])
        if result.returncode != 0:
            print(f"❌ Render failed for {file}.")
            has_error = True  # Flag the error, but keep the loop going!

    # Create the public distribution folder
    os.makedirs("resumes", exist_ok=True)

    # Collect all successful PDFs
    pdf_files = glob.glob("output/*/*.pdf")
    for pdf in pdf_files:
        shutil.copy(pdf, "resumes/")

    # Fail the script at the very end if anything went wrong
    if has_error:
        print("⚠️ Finished with errors. Successful PDFs were still moved to resumes/.")
        sys.exit(1)
    else:
        print("✨ All done! Check the resumes/ folder for your final PDFs.")


if __name__ == "__main__":
    main()
