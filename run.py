import argparse
import subprocess
import sys
import glob


def main():
    # Set up command-line argument parsing
    parser = argparse.ArgumentParser(
        description="Compile RenderCV resumes locally.")
    parser.add_argument(
        "file",
        nargs="?",
        help="Specific YAML file to compile or watch (optional)."
    )
    parser.add_argument(
        "--watch",
        action="store_true",
        help="Run RenderCV in watch mode to auto-compile on YAML changes."
    )
    args = parser.parse_args()

    # Determine which files to process
    if args.file:
        yaml_files = [args.file]
    else:
        yaml_files = glob.glob("src/resume*.yaml")

    if not yaml_files:
        print("❌ No YAML files found matching your request.")
        sys.exit(1)

    # ==========================================
    # WATCH MODE LOGIC (Single File Only)
    # ==========================================
    if args.watch:
        target_file = yaml_files[0]

        # If multiple files exist and no specific file was provided, ask the user!
        if len(yaml_files) > 1:
            print("📂 Multiple profiles found. Which one do you want to watch?")
            for i, f in enumerate(yaml_files, 1):
                print(f"  {i}. {f}")

            try:
                choice = int(
                    input("\nEnter the number (or press Ctrl+C to cancel): "))
                if 1 <= choice <= len(yaml_files):
                    target_file = yaml_files[choice - 1]
                else:
                    print("❌ Invalid selection.")
                    sys.exit(1)
            except ValueError:
                print("❌ Please enter a valid number.")
                sys.exit(1)
            except KeyboardInterrupt:
                print("\n✨ Cancelled.")
                sys.exit(0)

        print(f"\n👀 Starting RenderCV in watch mode for: {target_file}")
        print("   (Press Ctrl+C to stop watching)")
        try:
            subprocess.run(
                [sys.executable, "-m", "rendercv",
                    "render", target_file, "--watch"]
            )
        except KeyboardInterrupt:
            print("\n✨ Stopped watching.")
        return

    # ==========================================
    # STANDARD BUILD MODE (Single or Multiple)
    # ==========================================
    print(f"🚀 Compiling {len(yaml_files)} targeted resume(s)...\n")

    has_error = False

    for file in yaml_files:
        print(f"Building {file}...")
        result = subprocess.run(
            [sys.executable, "-m", "rendercv", "render", file]
        )
        if result.returncode != 0:
            print(f"❌ Render failed for {file}.")
            has_error = True

    if has_error:
        print("\n⚠️ Finished with errors, check the logs above.")
        print("Successful PDFs were still moved to output/.")
        sys.exit(1)
    else:
        print("\n✨ All done! Check the output/ folder for your final PDFs.")


if __name__ == "__main__":
    main()
