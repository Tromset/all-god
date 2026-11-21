# all-god

Dossier d'apologétique catholique : Dieu existe-t-il, et lequel ?

- **Le papier complet** (52 pages) : [`papier/sortie/dieu-chretien.pdf`](papier/sortie/dieu-chretien.pdf), aussi en [Word](papier/sortie/dieu-chretien.docx). Les chapitres sources sont dans [`papier/`](papier/).
- **La version courte** (3 pages) : [`resume-express.md`](resume-express.md), ou en [PDF](papier/sortie/resume-express.pdf).
- **Le dossier catholiques / orthodoxes** utilisé pour la partie VII : [`sources/catholique-orthodoxe/`](sources/catholique-orthodoxe/).

Pour régénérer le PDF, le Word et le résumé après une modification des chapitres :

```bash
papier/build.sh
```

Il faut `pandoc` et Node.js avec Playwright (Chromium).
