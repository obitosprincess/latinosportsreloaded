# Latino Sports — Redesign Concept

A modern redesign concept for [latinosports.com](https://www.latinosports.com), built as a single-file static site so it can be previewed instantly via GitHub Pages.

**Design references:** ESPN + NFL.com (data-dense layouts), Dribbble + Behance (modern UI/UX trends).
**Palette:** Puerto Rican freedom flag — sky blue `#4FC3F7` primary, deep navy `#061427`, white, with red `#E63946` reserved for LIVE / breaking indicators.

---

## What's in the demo

Four interlinked pages, all in one file (`index.html`), navigable through the top nav:

1. **Home** — utility bar, score ticker, hero + top stories, Pa Que Sepa video strip, stats slab, latest news.
2. **Article** — long-form story template with drop cap, pull quote, byline, share row, related stories.
3. **Scores** — sticky league rail, date pills, scoreboard cards (live + final + upcoming), AL East standings table with form dots.
4. **Category** — section landing page (MLB) with stat banner, filter toolbar, and stories grid.

Built with vanilla HTML/CSS/JS — no build step, no dependencies, fully responsive.

---

## Quick preview locally

Just open `index.html` in any browser:

```bash
# macOS
open index.html

# Linux
xdg-open index.html

# Windows
start index.html
```

Or run a tiny local server (recommended for clean refresh):

```bash
# Python
python3 -m http.server 8080
# → http://localhost:8080

# Node
npx serve .
```

---

## Deploy to GitHub Pages — automated

The `deploy.sh` script handles everything: git init → repo creation → push → enable Pages.

### One-time setup

Install the **GitHub CLI** (recommended — makes the script fully automatic):

```bash
# macOS
brew install gh

# Windows (winget)
winget install --id GitHub.cli

# Linux — see https://cli.github.com
```

Then sign in once:

```bash
gh auth login
```

### Run the deploy

```bash
chmod +x deploy.sh
./deploy.sh
```

That's it. The script will:

1. Initialize git in this folder
2. Create a public repo on your GitHub account (default name: `latinosports-redesign`)
3. Push the files
4. Enable GitHub Pages from the `main` branch
5. Print the live preview URL

The first build takes 30–90 seconds. Your preview will be live at:

```
https://<your-username>.github.io/latinosports-redesign/
```

### Custom repo name

```bash
./deploy.sh my-custom-repo-name
```

---

## Deploy to GitHub Pages — manual

If you'd rather not install the GitHub CLI:

1. **Create the repo on GitHub.** Go to <https://github.com/new>, name it `latinosports-redesign`, set it to public, click "Create repository". Don't initialize with anything.

2. **Push these files.** From inside this folder:

   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/<your-username>/latinosports-redesign.git
   git push -u origin main
   ```

3. **Enable Pages.** In the repo on GitHub:
   - Go to **Settings → Pages**
   - **Source:** Deploy from a branch
   - **Branch:** `main` · folder: `/ (root)`
   - Click **Save**

4. **Wait ~60 seconds**, then visit:

   ```
   https://<your-username>.github.io/latinosports-redesign/
   ```

---

## Updating the preview

After making edits to `index.html`:

```bash
git add .
git commit -m "Update design"
git push
```

GitHub Pages will rebuild automatically — usually within a minute.

---

## Files

| File         | Purpose                                                   |
|--------------|-----------------------------------------------------------|
| `index.html` | The full redesign — all four pages, styles, and scripts.  |
| `deploy.sh`  | One-shot deploy script for GitHub Pages.                  |
| `.nojekyll`  | Tells GitHub Pages to skip Jekyll (created on deploy).    |
| `.gitignore` | Standard ignores (created on deploy).                     |
| `README.md`  | This file.                                                |

---

## Notes

- This is a **concept mockup**, not a production site. Story content is representative (drawn from real Latino Sports beats — Yankees coverage by Rich Mancuso, Pa Que Sepa video series, Bill Menzel photo credit, etc.) but is meant for visual reference only.
- All data is hardcoded inside the HTML. To wire it to real content, the next step would be replacing the static markup with templates fed by the existing latinosports.com CMS (WordPress REST API or whatever the source of record is).
- The redesign is built mobile-first and tested down to 360px width.
