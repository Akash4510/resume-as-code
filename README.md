# 📄 Akash Gupta - Resume as Code

Welcome to the source code of my professional resume.

Instead of fighting with word processors or manual formatting, this repository treats my resume like a software project. It uses **RenderCV** (a YAML-to-PDF engine) and **Typst** (a modern typesetting system) to automatically compile a pixel-perfect, ATS-optimized PDF every time I push an update.

## ⚙️ Architecture

This project strictly separates **content** (data) from **design** (presentation).

- **Content:** All resume data (experience, projects, skills) lives in a single `src/resume.yaml` file.
- **Design Engine:** The visual layout is powered by a custom Typst templating engine located in `src/custom_theme/`.
- **Automation (CI/CD):** A GitHub Action `.github/workflows/compile.yml` listens for changes to the `master` branch. When triggered, it compiles the YAML data through the Typst engine and outputs the final artifacts.

## 📂 Repository Structure

\`\`\`text
.
├── .github/workflows/
│ └── compile.yml # CI/CD pipeline for automated PDF generation
├── output/
│ └── Akash_Gupta_CV.pdf # The final compiled resume artifact
└── src/
├── custom_theme/ # Typst / Jinja2 template engine (Do not touch)
└── resume.yaml # Core data file (Edit this to update the resume)
\`\`\`

## 🚀 How to Update the Resume

Updating this resume takes seconds and requires absolutely no formatting work.

1. Open `src/resume.yaml`.
2. Scroll to the **RESUME CONTENT** section.
3. Add, edit, or remove bullet points, jobs, or projects using standard Markdown syntax.
4. Commit and push the changes to GitHub.

The GitHub Action will automatically intercept the push, spin up the RenderCV environment, compile the new PDF, and drop it into the `output/` folder.

## 💻 Local Development

If you want to render the resume locally before pushing to GitHub, you need Python installed on your machine.

1. Install RenderCV:
   \`\`\`bash
   pip install rendercv
   \`\`\`
2. Run the compiler:
   \`\`\`bash
   rendercv render src/resume.yaml
   \`\`\`
   The updated PDF will be generated instantly in your local `output/` directory.

---

_Built with [RenderCV](https://github.com/rendercv/rendercv) and [Typst](https://typst.app/)._
