# 📄 Akash Gupta - Resume as Code

> Automated, CI/CD-driven resume platform built with Python, RenderCV, and Typst.

[![Compile Resume PDF](https://github.com/Akash4510/resume-as-code/actions/workflows/compile.yml/badge.svg)](https://github.com/Akash4510/resume-as-code/actions/workflows/compile.yml)

Welcome to the source code of my professional resumes.

Instead of fighting with word processors or manual formatting, this repository treats my resumes like a software project. It uses **RenderCV** (a YAML-to-PDF engine) and **Typst** (a modern typesetting system) to automatically compile a suite of pixel-perfect, ATS-optimized PDFs every time I push an update.

## ⚙️ Architecture

This project strictly separates **content** (data) from **design** (presentation) and supports multiple targeted resume profiles (e.g., Backend, Full-Stack).

- **Content:** All resume data lives in specific YAML files inside `src/` (e.g., `resume.yaml`, `resume_backend.yaml`).
- **Design Engine:** The visual layout is powered by a shared, custom Jinja2/Typst templating engine located in `src/customtheme/`.
- **Automation (CI/CD):** A fault-tolerant GitHub Action (`compile.yml`) listens for changes to the `master` branch. It dynamically loops through all profiles, compiles them into PDFs, and commits the final artifacts to the root `resumes/` directory.

## 📂 Repository Structure

```text
.
├── .github/workflows/
│   └── compile.yml           # CI/CD pipeline for automated PDF compilation
├── resumes/                  # 🚀 PUBLIC DISTRIBUTION: The final, compiled PDF resumes
├── output/                   # RenderCV build artifacts (ignored in version control)
├── src/
│   ├── customtheme/          # Shared Typst / Jinja2 template engine & entry styles
│   ├── resume.yaml           # Core data file for main resume (used for all roles)
│   ├── resume_backend.yaml   # Core data file for Backend roles (for specific targeting)
│   └── resume_fullstack.yaml # Core data file for Full-Stack roles
├── requirements.txt          # Pinned Python package dependencies
├── build.sh                  # Quick-build shell script for local development
└── run.py                    # Cross-platform Python execution script for local builds
```

## 🚀 How to Update the Resumes

Updating these resumes takes seconds and requires absolutely no manual formatting.

1. Open a target profile in `src/` (e.g., `resume_backend.yaml`).
2. Add, edit, or remove jobs, projects, or skills using standard YAML and Markdown syntax.
3. _Crucial:_ Ensure the file has an isolated output configuration at the bottom so build files don't clash:

```yaml
rendercv_settings:
  render_command:
    output_folder_name: "output/Akash_Gupta_Backend"
```

4. Commit and push the changes to GitHub.

The GitHub Action will automatically intercept the push, build all valid `resume*.yaml` profiles, and extract the fresh PDFs into the `resumes/` folder.

> **Note on Tailored One-Offs:** If you need a company-specific resume, duplicate a profile, name it `resume_tailored_<company>.yaml` (which is ignored by Git), build it locally, and submit. This keeps the repository completely clean.

## 🎨 Modifying or Changing the Template

This project strictly separates content from presentation. You are not locked into the current visual design and can easily modify it or swap it out entirely.

### Option 1: Modify the Existing Theme

The current visual layout is a custom theme powered by [Typst](https://typst.app/docs/) and [Jinja2](https://jinja.palletsprojects.com/).
To change fonts, spacing, margins, or the arrangement of elements:

1. Open the `src/customtheme/` folder.
2. Edit the `.j2` (Jinja2) files inside the `entries/` folder to change how specific sections (like Education or Experience) are structured.
3. Edit the main style variables in `src/customtheme/__init__.py` or the core Typst files to adjust global styles.

### Option 2: Use a Built-in RenderCV Theme

If you want to completely swap out the design without writing any code, RenderCV comes with several beautiful built-in themes (Classic, Sb2nov, EngineeringResumes, etc.).

To use a built-in theme:

1. Open your target profile (e.g., `src/resume_backend.yaml`).
2. Delete or comment out the current custom `design:` block.
3. Replace it with a built-in theme reference:
   ```yaml
   design:
     theme: classic # Options: classic, sb2nov, engineeringresumes
     font: Source Sans 3
     font_size: 10pt
     page_margins: 1.5cm
   ```
4. _Note: If you switch to a built-in theme, you can safely delete the `src/customtheme/` folder from this repository._

📚 **Helpful Links for Theming:**

- [RenderCV Theme Documentation](https://docs.rendercv.com/developer_guide/how_to/add_theme/)
- [Typst Documentation](https://typst.app/docs/reference/)

## 💻 Local Development & Environment Setup

To match the GitHub Actions runner and test changes locally inside a sandbox, follow these steps (configured for WSL Ubuntu / Zsh):

1. **Create and activate a virtual environment:**

```bash
python3 -m venv .venv
source .venv/bin/activate
```

2. **Install Dependencies:**

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

3. **Render the Resumes Locally:**
   You can compile your changes instantly using either of the built-in helper scripts. These scripts will safely build all profiles into the isolated `output/` directory so you can preview them locally without affecting version control.

- Using the shell script:

```bash
./build.sh
```

- Using the python script:

```bash
python run.py
```

**The updated PDFs will be generated instantly in your local `output/` directory.** _(Note: The root `resumes/` directory is strictly managed by CI/CD and will automatically update when you push your changes to GitHub)._

---

_Built with [RenderCV](https://github.com/rendercv/rendercv) and [Typst](https://typst.app/)._
