import subprocess
import sys
import glob


def main():
    print("🚀 Compiling all targeted resumes...\n")

    yaml_files = glob.glob("src/resume*.yaml")
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

    # Fail the script at the very end if anything went wrong
    if has_error:
        print("⚠️ Finished with errors, check the logs above.")
        print("Successful PDFs were still moved to output/.")
        sys.exit(1)
    else:
        print("✨ All done! Check the output/ folder for your final PDFs.")


if __name__ == "__main__":
    main()
