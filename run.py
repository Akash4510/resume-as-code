import subprocess
import sys

def main():
    print("🚀 Rendering resume...\n")
    # Run render command using the active python/venv interpreter
    result = subprocess.run([sys.executable, "-m", "rendercv", "render", "src/resume.yaml"])
    if result.returncode == 0:
        print("✨ Done! Check your output/ folder.")
    else:
        print("❌ Render failed.")
        sys.exit(result.returncode)

if __name__ == "__main__":
    main()
