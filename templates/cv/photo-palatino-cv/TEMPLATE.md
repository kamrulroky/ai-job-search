# Template: photo-palatino-cv

- **Type:** CV
- **Source extension:** .tex
- **Engine/toolchain:** pdflatex (display label: LaTeX)
- **Page limit:** 2 pages
- **Fonts:** Palatino (system / TeX distribution font)
- **Class/packages:** article, titlesec, tikz, graphicx, palatino, tabularx, hyperref, enumitem, glyphtounicode

## Compile command

    cd cv && pdflatex -interaction=nonstopmode <file>.tex

## Style rules

- Uses a two-column header with a circular cropped portrait photo (`formalP.jpg` via TikZ clip) on the left and candidate contact info on the right.
- Sections styled with small-caps headers and horizontal divider lines (`\titlerule`).
- Subheadings styled with bold job/degree titles and dates right-aligned using `\CVSubheading`.
- Body text set in Palatino 11pt on A4 paper.

## Known pitfalls

- Requires `formalP.jpg` in the same directory where the `.tex` file compiles.
- If compiling with LuaLaTeX or XeLaTeX, ensure TikZ and graphics paths are preserved.
