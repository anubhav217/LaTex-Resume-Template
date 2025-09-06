# LaTeX Resume Template

A compact, easy-to-customize XeLaTeX resume template producing a polished, one-page asymmetric two‑column layout (narrow left sidebar + wide main column). Designed for technical candidates (undergraduate/early-career engineers) but fully adaptable.

---

## Highlights

* Minimal, modern one-page design optimized for readability and ATS compatibility.
* Asymmetric two-column layout: left sidebar for skills/education; right column for summary, experience, and projects.
* Uses **XeLaTeX/LuaLaTeX** when available for system-font access via `fontspec`, with built-in engine fallbacks so the project remains usable under `pdfLaTeX` if necessary.
* Single source (`resume.tex`) that is straightforward to edit, extend, and integrate into CI.

---

## Repository contents

* `resume.tex` — Main source file; includes an engine-aware preamble (Xe/Lua + pdfLaTeX fallback).
* `Makefile` — Convenient local build targets (`make pdf`, `make clean`, etc.).
* `.latexmkrc` — `latexmk` configuration that prefers XeLaTeX.
* `.github/workflows/latex.yml` — Optional GitHub Actions workflow to auto-build a PDF on push (included in this repo).
* `README.md` — This file.
* `LICENSE` — MIT license.

---

## Requirements

* For full typographic control: **XeLaTeX** or **LuaLaTeX** (recommended).
* For maximum portability: **pdfLaTeX** is supported via a fallback mode that disables `fontspec` usage and uses LaTeX-native fonts.
* TeX distribution: TeX Live (recommended), MacTeX, or MiKTeX with relevant packages installed.

---

## Local build (recommended)

### Using `make`

```bash
# build PDF (uses latexmk under the hood)
make pdf

# clean intermediate files
make clean
```

### Direct with latexmk

```bash
latexmk -xelatex -pdf resume.tex
```

### Direct with xelatex

```bash
xelatex resume.tex
# run twice if necessary
xelatex resume.tex
```

---

## Overleaf / Online editors

If you open this project in Overleaf (or any online editor that defaults to pdfLaTeX), change the compiler to **XeLaTeX** (or **LuaLaTeX**) before compiling:

* **Overleaf**: Menu → *Settings* → *Compiler* → **XeLaTeX** → Recompile.

This is required because the template uses `fontspec` under Xe/Lua engines for system fonts; the repo includes a fallback so it still compiles under pdfLaTeX, but for full font control use XeLaTeX.

---

## Engine compatibility

`resume.tex` contains a small engine-detection block that:

* Loads `fontspec` and system fonts when compiling with XeLaTeX or LuaLaTeX.
* Falls back to `fontenc`/`inputenc` and a LaTeX-native font package (e.g., `newtxtext/newtxmath`) when using pdfLaTeX.

This keeps the source portable while preserving modern typography when Xe/Lua are available. See `resume.tex` for the exact conditional implementation.

---

## CI / GitHub Actions (auto-build on push)

A GitHub Actions workflow (included at `.github/workflows/latex.yml`) can build the PDF automatically when you push to the repo. The workflow runs on `ubuntu-latest` and executes `xelatex` (via a community action) so the built PDF appears in the build artifacts.

**Advantages**

* Always have an up-to-date PDF artifact on each push.
* Useful for maintaining a public resume PDF in a GitHub Pages site or release.

**Included workflow (what it does)**

* Checks out the repo.
* Installs TeX Live or uses a LaTeX action that provides xelatex.
* Compiles `resume.tex` with `xelatex` (multiple passes if needed).
* Uploads the compiled PDF as an artifact.

If you want, I can enable the workflow file in the repository and customize it (e.g., attach the PDF to releases, or publish to GitHub Pages).

---

## Makefile / latexmk config

This repo contains a `Makefile` with targets for `pdf`, `clean`, and `watch` (if `latexmk` is available). The `.latexmkrc` defaults to using XeLaTeX.

---

## Contributing

Contributions are welcome. If you open a pull request, describe layout changes and include a sample PDF where applicable.

---

## License

MIT — see `LICENSE`.

---
