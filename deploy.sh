#!/usr/bin/env bash
# =====================================================================
# Latino Sports — Redesign Concept · GitHub Pages Deploy Script
# =====================================================================
# What this does:
#   1. Initializes a git repo in this folder (if not already a repo)
#   2. Creates the GitHub repo using the `gh` CLI (or instructs you how)
#   3. Commits all files and pushes to GitHub
#   4. Enables GitHub Pages from the `main` branch
#   5. Prints the live preview URL when ready
#
# Requirements:
#   - git installed         (https://git-scm.com)
#   - GitHub CLI installed  (https://cli.github.com)  -- optional but recommended
#   - You are signed in:    `gh auth login`
#
# Usage:
#   chmod +x deploy.sh
#   ./deploy.sh                              # interactive
#   ./deploy.sh latinosports-redesign        # specify repo name
# =====================================================================

set -e

# ---- Colors ----------------------------------------------------------
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

say()  { echo -e "${BLUE}▸${NC} $1"; }
ok()   { echo -e "${GREEN}✔${NC} $1"; }
warn() { echo -e "${YELLOW}!${NC} $1"; }
err()  { echo -e "${RED}✖${NC} $1"; }

# ---- Config ----------------------------------------------------------
REPO_NAME="${1:-latinosports-redesign}"
COMMIT_MSG="Initial commit — Latino Sports redesign concept"
BRANCH="main"

echo ""
echo "============================================================"
echo "  Latino Sports — Redesign Concept · Deploy to GitHub Pages"
echo "============================================================"
echo ""

# ---- Pre-flight checks ----------------------------------------------
if ! command -v git >/dev/null 2>&1; then
  err "git is not installed. Install it from https://git-scm.com and re-run."
  exit 1
fi
ok "git is installed ($(git --version))"

GH_AVAILABLE=0
if command -v gh >/dev/null 2>&1; then
  if gh auth status >/dev/null 2>&1; then
    GH_AVAILABLE=1
    ok "GitHub CLI is installed and authenticated"
  else
    warn "GitHub CLI is installed but not signed in — run 'gh auth login' first."
  fi
else
  warn "GitHub CLI ('gh') not installed — falling back to manual mode."
fi

if [ ! -f "index.html" ]; then
  err "index.html not found in this folder. Run this script from the project root."
  exit 1
fi
ok "index.html present ($(wc -c < index.html | awk '{print $1}') bytes)"

# ---- Initialize git --------------------------------------------------
if [ -d ".git" ]; then
  ok "Already a git repository — skipping init."
else
  say "Initializing git repository..."
  git init -q
  git checkout -q -b "$BRANCH" 2>/dev/null || git branch -m "$BRANCH"
  ok "Initialized."
fi

# ---- Create .gitignore + .nojekyll ----------------------------------
cat > .gitignore <<'EOF'
.DS_Store
node_modules/
.idea/
.vscode/
*.log
EOF

# .nojekyll tells GitHub Pages not to run Jekyll — we're plain HTML.
touch .nojekyll
ok ".gitignore and .nojekyll written."

# ---- Stage and commit ------------------------------------------------
git add -A

if git diff --cached --quiet; then
  warn "No changes to commit."
else
  git -c user.email="deploy@local" -c user.name="deploy-script" commit -q -m "$COMMIT_MSG"
  ok "Committed: $COMMIT_MSG"
fi

# ---- Create remote (gh CLI path) -------------------------------------
if [ "$GH_AVAILABLE" = "1" ]; then
  say "Creating GitHub repo '$REPO_NAME' (public) and pushing..."

  if gh repo view "$REPO_NAME" >/dev/null 2>&1; then
    warn "Repo '$REPO_NAME' already exists on your account."
    read -p "Push to existing repo and overwrite Pages source? [y/N] " yn
    [[ ! "$yn" =~ ^[Yy]$ ]] && { err "Aborted."; exit 1; }
    GH_USER=$(gh api user -q .login)
    git remote add origin "https://github.com/$GH_USER/$REPO_NAME.git" 2>/dev/null || true
    git push -u origin "$BRANCH" --force
  else
    gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
  fi

  ok "Pushed to GitHub."

  # Enable Pages from main branch root
  GH_USER=$(gh api user -q .login)
  say "Enabling GitHub Pages on branch '$BRANCH'..."

  # First try the API to enable Pages
  gh api -X POST "repos/$GH_USER/$REPO_NAME/pages" \
    -f "source[branch]=$BRANCH" \
    -f "source[path]=/" \
    >/dev/null 2>&1 || \
  gh api -X PUT "repos/$GH_USER/$REPO_NAME/pages" \
    -f "source[branch]=$BRANCH" \
    -f "source[path]=/" \
    >/dev/null 2>&1 || \
  warn "Could not auto-enable Pages via API. Enable manually at:
        https://github.com/$GH_USER/$REPO_NAME/settings/pages
        (Source: Deploy from a branch · Branch: $BRANCH · /root)"

  PAGES_URL="https://$GH_USER.github.io/$REPO_NAME/"
  echo ""
  echo "============================================================"
  ok "Deployed!"
  echo ""
  echo "  Repo:    https://github.com/$GH_USER/$REPO_NAME"
  echo "  Preview: $PAGES_URL"
  echo ""
  echo "  Note: GitHub Pages takes ~30–90 seconds to build the first time."
  echo "============================================================"

else
  # ---- Manual fallback path ----------------------------------------
  echo ""
  echo "------------------------------------------------------------"
  warn "GitHub CLI ('gh') wasn't available. Finish manually:"
  echo ""
  echo "  1. Create a new public repo on GitHub:"
  echo "       https://github.com/new   (name it: $REPO_NAME)"
  echo ""
  echo "  2. Then run these two commands here:"
  echo "       git remote add origin https://github.com/<your-username>/$REPO_NAME.git"
  echo "       git push -u origin $BRANCH"
  echo ""
  echo "  3. Enable Pages:"
  echo "       Settings → Pages →"
  echo "       Source: Deploy from a branch · Branch: $BRANCH · /(root) · Save"
  echo ""
  echo "  4. Your live preview will appear at:"
  echo "       https://<your-username>.github.io/$REPO_NAME/"
  echo "------------------------------------------------------------"
fi

echo ""
