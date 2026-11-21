#!/usr/bin/env bash
# Construit le papier (HTML, PDF, DOCX) et le résumé express à partir des chapitres Markdown.
set -euo pipefail
cd "$(dirname "$0")"
T=build-tools
mkdir -p sortie
CH=(00-introduction.md 01-dieu-existe.md 02-branche-non.md 03-religion-abrahamique.md 04-christianisme.md 05-islam.md 06-judaisme.md 07-eglise-catholique.md 08-objections-conclusion.md 09-annexes.md)
META=(--metadata-file="$T/metadata.yaml")
pandoc "${CH[@]}" -f markdown -t html5 --standalone --template="$T/template.html" --variable styles="$(cat $T/styles.css)" --toc --toc-depth=2 "${META[@]}" -o sortie/dieu-chretien.html
node "$T/pdf.js" sortie/dieu-chretien.html sortie/dieu-chretien.pdf
pandoc "${CH[@]}" -f markdown -t docx --toc --toc-depth=2 "${META[@]}" -o sortie/dieu-chretien.docx
pandoc ../resume-express.md -f markdown -t html5 --standalone --template="$T/template-resume.html" --variable styles="$(cat $T/styles.css)" --metadata title="La version courte" --metadata lang=fr -o sortie/resume-express.html
node "$T/pdf.js" sortie/resume-express.html sortie/resume-express.pdf
echo "OK"
