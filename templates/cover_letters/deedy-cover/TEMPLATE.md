# Template: deedy-cover

- **Type:** Cover letter
- **Source extension:** .tex
- **Engine/toolchain:** xelatex (display label: XeLaTeX)
- **Page limit:** 1-2 pages
- **Fonts:** Lato, Raleway (bundled in OpenFonts/fonts/)
- **Class/packages:** cover.cls, fontspec, xltxtra, xunicode, titlesec, textpos, geometry, hyperref, xcolor

## Compile command

    cd cover_letters && xelatex -interaction=nonstopmode <file>.tex

## Style rules

- Header styled with `\namesection{}{Name}{Contact}` in Lato & Raleway fonts.
- Two-column header layout using minipages for company address and current date.
- Optional `\lettertitle{Subject / Betreff}` for German/European applications.
- Body paragraphs wrapped in `\lettercontent{...}`.

## Known pitfalls

- Requires `OpenFonts/` font directory and `cover.cls` in the working directory.
- Must compile with `xelatex` because `fontspec` loads `.ttf`/`.otf` font files directly.
