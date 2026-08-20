# 📄 Akash Gupta - Resume as Code

Welcome to the source code of my professional resume.

Instead of fighting with word processors or manual formatting, this repository treats my resume like a software project. It uses **RenderCV** (a YAML-to-PDF engine) and **Typst** (a modern typesetting system) to automatically compile a pixel-perfect, ATS-optimized PDF every time I push an update.

## ⚙️ Architecture

This project strictly separates **content** (data) from **design** (presentation).

- **Content:** All resume data (experience, projects, skills) lives in a single `src/resume.yaml` file.
- **Design Engine:** The visual layout is powered by a custom Jinja2/Typst templating engine located in `src/customtheme/`.
- **Automation (CI/CD):** A GitHub Action (`.github/workflows/compile.yml`) listens for changes to the `master` branch. When triggered, it spins up a python environment, compiles the YAML data through the custom theme, and automatically commits the updated PDF back to the repository.

## 📂 Repository Structure

```text
.
├── .github/workflows/
│   └── compile.yml        # CI/CD pipeline for automated PDF compilation
├── output/
│   └── Akash_Gupta_CV.pdf # The final compiled resume artifact
├── src/
│   ├── customtheme/       # Custom Typst / Jinja2 template engine & entry styles
│   │   └── entries/       # Specialized entry layouts (Experience, Education, Projects, etc.)
│   └── resume.yaml        # Core data file (Edit this to update resume content)
├── requirements.txt       # Pinned Python package dependencies
├── build.sh               # Quick-build shell script for local development
└── run.py                 # Cross-platform Python execution script for local builds
```

## 🚀 How to Update the Resume

Updating this resume takes seconds and requires absolutely no manual formatting work.

1. Open `src/resume.yaml`.
2. Scroll to the **RESUME CONTENT** section.
3. Add, edit, or remove bullet points, jobs, or projects using standard YAML and Markdown syntax.
4. Commit and push the changes to GitHub.

The GitHub Action will automatically intercept the push, build the resume, and commit the fresh PDF artifact.

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

3. **Render the Resume Locally:**
   You can compile your changes instantly using either of the built-in helper scripts:

- Manually using python:

```bash
python -m rendercv render src/resume.yaml
```

- Using the shell script:

```bash
./build.sh
```

- Using the python script:

```bash
python run.py
```

The updated PDF will be generated instantly in your root `output/` directory.

_Built with [RenderCV](https://github.com/rendercv/rendercv) and [Typst](https://typst.app/)._
