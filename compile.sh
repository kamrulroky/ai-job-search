#!/bin/bash
# Convenient compilation helper script

set -e

case "$1" in
  cv)
    echo "Compiling CVs..."
    cd cv
    if [ -n "$2" ]; then
      pdflatex -interaction=nonstopmode "$2"
    else
      pdflatex -interaction=nonstopmode main_Fraunhofer_IPMS_PhD.tex
    fi
    ;;
  cover)
    echo "Compiling Cover Letters..."
    cd cover_letters
    if [ -n "$2" ]; then
      xelatex -interaction=nonstopmode "$2"
    else
      xelatex -interaction=nonstopmode cover_Fraunhofer_IPMS_PhD.tex
    fi
    ;;
  watch)
    echo "Watching for .tex changes in cv/ and cover_letters/ (Press Ctrl+C to stop)..."
    while true; do
      inotifywait -q -e close_write cv/*.tex cover_letters/*.tex 2>/dev/null || sleep 2
      echo "[$(date +'%T')] Change detected, recompiling..."
      (cd cv && pdflatex -interaction=nonstopmode main_Fraunhofer_IPMS_PhD.tex >/dev/null 2>&1 || true)
      (cd cover_letters && xelatex -interaction=nonstopmode cover_Fraunhofer_IPMS_PhD.tex >/dev/null 2>&1 || true)
      echo "[$(date +'%T')] Compiled successfully!"
    done
    ;;
  *)
    echo "Compiling all documents..."
    (cd cv && pdflatex -interaction=nonstopmode main_Fraunhofer_IPMS_PhD.tex)
    (cd cover_letters && xelatex -interaction=nonstopmode cover_Fraunhofer_IPMS_PhD.tex)
    cp cv/main_Fraunhofer_IPMS_PhD.pdf documents/applications/Fraunhofer_IPMS_PhD_Smart_Sensing/cv_draft.pdf 2>/dev/null || true
    cp cover_letters/cover_Fraunhofer_IPMS_PhD.pdf documents/applications/Fraunhofer_IPMS_PhD_Smart_Sensing/cover_letter.pdf 2>/dev/null || true
    echo "Done! PDFs updated."
    ;;
esac
