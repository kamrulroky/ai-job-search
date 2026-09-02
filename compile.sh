#!/bin/bash
# Smart compilation helper script that automatically targets the latest modified .tex files

set -e

LATEST_CV=$(ls -t cv/*.tex 2>/dev/null | grep -v "main_example" | head -n 1)
LATEST_COVER=$(ls -t cover_letters/*.tex 2>/dev/null | grep -v "cover_example" | head -n 1)

case "$1" in
  cv)
    TARGET="${2:-$(basename "$LATEST_CV")}"
    echo "Compiling CV: cv/$TARGET"
    (cd cv && pdflatex -interaction=nonstopmode "$TARGET")
    ;;
  cover)
    TARGET="${2:-$(basename "$LATEST_COVER")}"
    echo "Compiling Cover Letter: cover_letters/$TARGET"
    (cd cover_letters && xelatex -interaction=nonstopmode "$TARGET")
    ;;
  watch)
    echo "Auto-watcher active on cv/ and cover_letters/ (Press Ctrl+C to stop)..."
    while true; do
      inotifywait -q -e close_write cv/*.tex cover_letters/*.tex 2>/dev/null || sleep 2
      CURR_CV=$(ls -t cv/*.tex 2>/dev/null | grep -v "main_example" | head -n 1)
      CURR_COVER=$(ls -t cover_letters/*.tex 2>/dev/null | grep -v "cover_example" | head -n 1)
      echo "[$(date +'%T')] Change detected! Compiling $(basename "$CURR_CV") and $(basename "$CURR_COVER")..."
      (cd cv && pdflatex -interaction=nonstopmode "$(basename "$CURR_CV")" >/dev/null 2>&1 || true)
      (cd cover_letters && xelatex -interaction=nonstopmode "$(basename "$CURR_COVER")" >/dev/null 2>&1 || true)
      echo "[$(date +'%T')] Compiled successfully!"
    done
    ;;
  *)
    TARGET_CV=$(basename "$LATEST_CV")
    TARGET_COVER=$(basename "$LATEST_COVER")
    echo "Compiling latest CV ($TARGET_CV) and Cover Letter ($TARGET_COVER)..."
    (cd cv && pdflatex -interaction=nonstopmode "$TARGET_CV")
    (cd cover_letters && xelatex -interaction=nonstopmode "$TARGET_COVER")
    
    # Sync with application folder if DLR 5941
    if [[ "$TARGET_CV" =~ "5941" ]]; then
      cp cv/"$TARGET_CV" documents/applications/DLR_SC_Flugsoftware_5941_Payload/cv_draft.tex 2>/dev/null || true
      cp cv/"${TARGET_CV%.tex}.pdf" documents/applications/DLR_SC_Flugsoftware_5941_Payload/cv_draft.pdf 2>/dev/null || true
      cp cover_letters/"$TARGET_COVER" documents/applications/DLR_SC_Flugsoftware_5941_Payload/cover_letter.tex 2>/dev/null || true
      cp cover_letters/"${TARGET_COVER%.tex}.pdf" documents/applications/DLR_SC_Flugsoftware_5941_Payload/cover_letter.pdf 2>/dev/null || true
    fi
    echo "Done! Both PDFs successfully compiled and updated."
    ;;
esac
