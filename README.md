<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Latino Sports — Redesign Concept</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Archivo+Black&family=Inter:wght@300;400;500;600;700;800;900&family=Manrope:wght@400;600;700;800&display=swap" rel="stylesheet">
<style>
  /* =====================================================
     LATINO SPORTS — REDESIGN CONCEPT
     Inspired by: ESPN + NFL.com (data-dense layouts)
                  Dribbble + Behance (modern UI/UX trends)
     Palette: Puerto Rican Freedom Flag — sky blue primary,
              deep navy + white supporting, red for "LIVE".
     ===================================================== */

  :root {
    /* Puerto Rican Freedom Flag inspired palette */
    --pr-sky:        #4FC3F7;   /* Freedom flag sky blue (primary accent) */
    --pr-sky-glow:   #80DEEA;   /* Lighter aqua highlight */
    --pr-sky-deep:   #0288D1;   /* Deeper sky for hover/active */
    --pr-navy:       #061427;   /* Deep navy/near-black for surfaces */
    --pr-navy-2:     #0B2545;   /* Secondary dark surface */
    --pr-navy-3:     #13315C;   /* Cards / elevated surfaces */
    --pr-white:      #FFFFFF;
    --pr-cream:      #F4F7FB;
    --pr-line:       rgba(255,255,255,0.08);
    --pr-line-strong:rgba(255,255,255,0.18);
    --pr-red:        #E63946;   /* Reserved for LIVE / breaking */
    --pr-red-glow:   #FF4D5E;
    --pr-text:       #E8EEF5;
    --pr-text-mute:  #8FA3BD;
    --pr-text-dim:   #5E7591;

    --radius-sm: 6px;
    --radius:    12px;
    --radius-lg: 20px;
    --radius-xl: 28px;

    --shadow-sm: 0 2px 6px rgba(0,0,0,0.25);
    --shadow:    0 10px 30px rgba(0,0,0,0.35);
    --shadow-lg: 0 20px 50px rgba(0,0,0,0.45);

    --container: 1440px;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }
  html { scroll-behavior: smooth; }
  body {
    font-family: 'Inter', system-ui, -apple-system, Segoe UI, Roboto, sans-serif;
    background: var(--pr-navy);
    color: var(--pr-text);
    -webkit-font-smoothing: antialiased;
    line-height: 1.55;
    overflow-x: hidden;
  }
  a { color: inherit; text-decoration: none; }
  button { font: inherit; cursor: pointer; border: none; background: none; color: inherit; }
  img { max-width: 100%; display: block; }

  /* ==========================================
     1. TOP UTILITY BAR (date / language / live)
     ========================================== */
  .util-bar {
    background: #03101F;
    border-bottom: 1px solid var(--pr-line);
    font-size: 12px;
    letter-spacing: 0.04em;
    color: var(--pr-text-mute);
  }
  .util-bar .wrap {
    max-width: var(--container);
    margin: 0 auto;
    padding: 8px 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
  }
  .util-bar .left { display: flex; gap: 18px; align-items: center; }
  .util-bar .right { display: flex; gap: 14px; align-items: center; }
  .util-bar .live-pill {
    background: var(--pr-red);
    color: white;
    padding: 2px 8px;
    border-radius: 4px;
    font-weight: 700;
    font-size: 10px;
    letter-spacing: 0.12em;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    animation: pulse 2s infinite;
  }
  .util-bar .live-pill::before {
    content:"";
    width: 6px; height: 6px;
    background: white;
    border-radius: 50%;
  }
  @keyframes pulse {
    0%,100% { box-shadow: 0 0 0 0 rgba(230,57,70,0.6); }
    50%     { box-shadow: 0 0 0 6px rgba(230,57,70,0); }
  }
  .util-bar .lang {
    display: inline-flex;
    background: rgba(255,255,255,0.06);
    border-radius: 999px;
    padding: 2px;
  }
  .util-bar .lang button {
    padding: 4px 12px;
    border-radius: 999px;
    font-size: 11px;
    font-weight: 600;
    color: var(--pr-text-mute);
  }
  .util-bar .lang button.active {
    background: var(--pr-sky);
    color: var(--pr-navy);
  }

  /* ==========================================
     2. SCORE TICKER (ESPN-style)
     ========================================== */
  .ticker {
    background: linear-gradient(90deg, #03101F 0%, #061427 50%, #03101F 100%);
    border-bottom: 1px solid var(--pr-line);
    overflow: hidden;
    position: relative;
  }
  .ticker .wrap {
    max-width: var(--container);
    margin: 0 auto;
    display: flex;
    align-items: stretch;
  }
  .ticker .label {
    background: var(--pr-sky);
    color: var(--pr-navy);
    font-weight: 800;
    font-size: 11px;
    letter-spacing: 0.16em;
    padding: 10px 16px;
    display: flex;
    align-items: center;
    flex-shrink: 0;
  }
  .ticker-track {
    display: flex;
    gap: 0;
    overflow-x: auto;
    scrollbar-width: none;
    flex: 1;
  }
  .ticker-track::-webkit-scrollbar { display: none; }
  .ticker-game {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 8px 18px;
    border-right: 1px solid var(--pr-line);
    flex-shrink: 0;
    font-size: 12px;
    min-width: 200px;
  }
  .ticker-game .league {
    color: var(--pr-text-dim);
    font-weight: 700;
    font-size: 10px;
    letter-spacing: 0.1em;
  }
  .ticker-game .teams {
    display: flex;
    flex-direction: column;
    gap: 2px;
    flex: 1;
  }
  .ticker-game .row {
    display: flex;
    justify-content: space-between;
    gap: 8px;
  }
  .ticker-game .row .name { font-weight: 600; color: var(--pr-text); }
  .ticker-game .row .score { font-weight: 800; color: var(--pr-sky); font-variant-numeric: tabular-nums; }
  .ticker-game .row.win .name { color: white; }
  .ticker-game .status {
    font-size: 10px;
    color: var(--pr-text-dim);
    letter-spacing: 0.1em;
    font-weight: 700;
  }
  .ticker-game.live .status {
    color: var(--pr-red-glow);
  }
  .ticker-game.live .status::before {
    content: "● ";
    animation: blink 1.2s infinite;
  }
  @keyframes blink { 50% { opacity: 0.3; } }

  /* ==========================================
     3. PRIMARY HEADER / NAV
     ========================================== */
  header.main {
    background: var(--pr-navy);
    border-bottom: 1px solid var(--pr-line);
    position: sticky;
    top: 0;
    z-index: 100;
    backdrop-filter: blur(12px);
  }
  header.main .wrap {
    max-width: var(--container);
    margin: 0 auto;
    padding: 16px 24px;
    display: flex;
    align-items: center;
    gap: 32px;
  }
  .logo {
    display: flex;
    align-items: center;
    gap: 12px;
    flex-shrink: 0;
  }
  .logo .mark {
    width: 44px;
    height: 44px;
    border-radius: 10px;
    background: linear-gradient(135deg, var(--pr-sky) 0%, var(--pr-sky-deep) 100%);
    display: grid;
    place-items: center;
    font-family: 'Archivo Black', sans-serif;
    color: var(--pr-navy);
    font-size: 20px;
    box-shadow: 0 8px 20px rgba(79,195,247,0.35);
    position: relative;
    overflow: hidden;
  }
  .logo .mark::after {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, transparent 50%, rgba(255,255,255,0.2) 50%);
  }
  .logo .word {
    font-family: 'Archivo Black', sans-serif;
    font-size: 20px;
    letter-spacing: -0.01em;
    line-height: 1;
  }
  .logo .word .sport {
    color: var(--pr-sky);
  }
  .logo .tag {
    font-size: 10px;
    color: var(--pr-text-dim);
    letter-spacing: 0.18em;
    text-transform: uppercase;
    margin-top: 4px;
    font-weight: 600;
  }

  nav.primary {
    display: flex;
    gap: 4px;
    flex: 1;
    overflow-x: auto;
    scrollbar-width: none;
  }
  nav.primary::-webkit-scrollbar { display: none; }
  nav.primary a {
    padding: 10px 14px;
    font-weight: 700;
    font-size: 13px;
    letter-spacing: 0.04em;
    color: var(--pr-text-mute);
    text-transform: uppercase;
    border-radius: 8px;
    transition: 0.2s;
    white-space: nowrap;
    position: relative;
  }
  nav.primary a:hover {
    color: white;
    background: rgba(79,195,247,0.08);
  }
  nav.primary a.active {
    color: var(--pr-navy);
    background: var(--pr-sky);
  }
  nav.primary a.has-new::after {
    content:"";
    width: 6px; height: 6px;
    background: var(--pr-red);
    border-radius: 50%;
    position: absolute;
    top: 8px; right: 8px;
  }

  .header-actions {
    display: flex;
    gap: 8px;
    align-items: center;
    flex-shrink: 0;
  }
  .icon-btn {
    width: 40px; height: 40px;
    border-radius: 10px;
    border: 1px solid var(--pr-line);
    display: grid;
    place-items: center;
    color: var(--pr-text);
    transition: 0.2s;
  }
  .icon-btn:hover {
    border-color: var(--pr-sky);
    color: var(--pr-sky);
    background: rgba(79,195,247,0.08);
  }
  .btn-primary {
    background: var(--pr-sky);
    color: var(--pr-navy);
    padding: 10px 18px;
    border-radius: 10px;
    font-weight: 800;
    font-size: 13px;
    letter-spacing: 0.04em;
    transition: 0.2s;
    text-transform: uppercase;
  }
  .btn-primary:hover {
    background: white;
    transform: translateY(-1px);
    box-shadow: 0 8px 20px rgba(79,195,247,0.4);
  }

  /* ==========================================
     4. PAGE ROUTER (in-page tabs simulation)
     ========================================== */
  .page { display: none; }
  .page.active { display: block; animation: fade 0.4s ease; }
  @keyframes fade {
    from { opacity: 0; transform: translateY(8px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* ==========================================
     5. HOMEPAGE — HERO
     ========================================== */
  .hero {
    max-width: var(--container);
    margin: 0 auto;
    padding: 32px 24px;
    display: grid;
    grid-template-columns: 1.6fr 1fr;
    gap: 24px;
  }
  .hero-main {
    position: relative;
    border-radius: var(--radius-xl);
    overflow: hidden;
    aspect-ratio: 16/10;
    background: linear-gradient(135deg, #0B2545 0%, #061427 100%);
    cursor: pointer;
    transition: 0.4s;
  }
  .hero-main::before {
    content: "";
    position: absolute;
    inset: 0;
    background:
      radial-gradient(ellipse at top right, rgba(79,195,247,0.25), transparent 60%),
      linear-gradient(180deg, transparent 0%, transparent 40%, rgba(0,0,0,0.85) 100%),
      url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 500"><defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="%230B2545"/><stop offset="1" stop-color="%2313315C"/></linearGradient></defs><rect width="800" height="500" fill="url(%23g)"/><circle cx="200" cy="180" r="120" fill="%234FC3F7" opacity="0.15"/><circle cx="600" cy="350" r="160" fill="%234FC3F7" opacity="0.1"/><path d="M0,400 Q200,320 400,380 T800,360 L800,500 L0,500 Z" fill="%23061427" opacity="0.6"/></svg>');
    background-size: cover;
    background-position: center;
  }
  .hero-main:hover { transform: translateY(-3px); box-shadow: var(--shadow-lg); }
  .hero-main .badge-row {
    position: absolute;
    top: 24px; left: 24px;
    display: flex;
    gap: 8px;
    z-index: 2;
  }
  .badge {
    padding: 6px 12px;
    border-radius: 999px;
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    background: rgba(255,255,255,0.12);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255,255,255,0.15);
  }
  .badge.sport { background: var(--pr-sky); color: var(--pr-navy); border: none; }
  .badge.live  { background: var(--pr-red); color: white; border: none; }
  .badge.live::before { content: "● "; animation: blink 1.2s infinite; }

  .hero-main .body {
    position: absolute;
    bottom: 0; left: 0; right: 0;
    padding: 32px;
    z-index: 2;
  }
  .hero-main h1 {
    font-family: 'Archivo Black', sans-serif;
    font-size: clamp(28px, 3.4vw, 52px);
    line-height: 1.02;
    letter-spacing: -0.02em;
    margin-bottom: 16px;
    color: white;
    max-width: 90%;
  }
  .hero-main .meta {
    display: flex;
    gap: 16px;
    align-items: center;
    color: var(--pr-text-mute);
    font-size: 13px;
    font-weight: 500;
  }
  .hero-main .meta .dot { color: var(--pr-sky); }
  .hero-main .meta strong { color: white; }

  .hero-side {
    display: grid;
    grid-template-rows: 1fr 1fr;
    gap: 24px;
  }
  .hero-card {
    position: relative;
    border-radius: var(--radius-lg);
    overflow: hidden;
    background: var(--pr-navy-3);
    cursor: pointer;
    transition: 0.3s;
    display: flex;
    flex-direction: column;
  }
  .hero-card:hover { transform: translateY(-2px); box-shadow: var(--shadow); }
  .hero-card .visual {
    height: 55%;
    position: relative;
    overflow: hidden;
  }
  .hero-card .visual::before {
    content: "";
    position: absolute; inset: 0;
    background: linear-gradient(135deg, var(--pr-sky-deep), var(--pr-navy-2));
  }
  .hero-card .visual.boxing::before {
    background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, var(--pr-red) 200%);
  }
  .hero-card .visual.basketball::before {
    background: linear-gradient(135deg, var(--pr-navy-2) 0%, #ff8c42 200%);
  }
  .hero-card .visual .badge-row {
    position: absolute;
    top: 16px; left: 16px;
  }
  .hero-card .body {
    padding: 18px 20px;
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  .hero-card h3 {
    font-family: 'Manrope', sans-serif;
    font-size: 18px;
    font-weight: 800;
    line-height: 1.25;
    color: white;
    margin-bottom: 8px;
  }
  .hero-card .meta {
    color: var(--pr-text-dim);
    font-size: 12px;
  }

  /* ==========================================
     6. SECTION TITLES
     ========================================== */
  .section {
    max-width: var(--container);
    margin: 0 auto;
    padding: 32px 24px;
  }
  .section-head {
    display: flex;
    align-items: end;
    justify-content: space-between;
    margin-bottom: 24px;
    gap: 16px;
    flex-wrap: wrap;
  }
  .section-head h2 {
    font-family: 'Archivo Black', sans-serif;
    font-size: clamp(24px, 2vw, 32px);
    letter-spacing: -0.01em;
    line-height: 1;
    position: relative;
    padding-left: 16px;
  }
  .section-head h2::before {
    content: "";
    position: absolute;
    left: 0; top: 4px; bottom: 4px;
    width: 5px;
    background: var(--pr-sky);
    border-radius: 4px;
  }
  .section-head .actions { display: flex; gap: 8px; align-items: center; }
  .section-head .filter-pill {
    padding: 8px 14px;
    border-radius: 999px;
    border: 1px solid var(--pr-line-strong);
    font-size: 12px;
    font-weight: 700;
    color: var(--pr-text-mute);
    transition: 0.2s;
  }
  .section-head .filter-pill.active,
  .section-head .filter-pill:hover {
    background: var(--pr-sky);
    color: var(--pr-navy);
    border-color: var(--pr-sky);
  }

  /* ==========================================
     7. STORIES GRID
     ========================================== */
  .stories-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 20px;
  }
  .story {
    background: var(--pr-navy-3);
    border-radius: var(--radius-lg);
    overflow: hidden;
    cursor: pointer;
    transition: 0.3s;
    border: 1px solid transparent;
  }
  .story:hover {
    transform: translateY(-4px);
    border-color: var(--pr-sky);
    box-shadow: 0 20px 40px rgba(0,0,0,0.4);
  }
  .story .thumb {
    aspect-ratio: 16/10;
    background: linear-gradient(135deg, var(--pr-navy-2), var(--pr-sky-deep));
    position: relative;
    overflow: hidden;
  }
  .story .thumb::before {
    content: "";
    position: absolute;
    inset: 0;
    background:
      radial-gradient(circle at 30% 30%, rgba(79,195,247,0.4) 0%, transparent 50%),
      radial-gradient(circle at 80% 80%, rgba(255,255,255,0.1) 0%, transparent 40%);
  }
  .story .thumb .badge-row {
    position: absolute;
    top: 12px; left: 12px;
  }
  .story .thumb .duration {
    position: absolute;
    bottom: 12px; right: 12px;
    background: rgba(0,0,0,0.7);
    color: white;
    padding: 4px 8px;
    border-radius: 4px;
    font-size: 11px;
    font-weight: 700;
    backdrop-filter: blur(8px);
  }
  .story .body {
    padding: 18px 20px;
  }
  .story .body .category {
    color: var(--pr-sky);
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    margin-bottom: 8px;
  }
  .story h3 {
    font-family: 'Manrope', sans-serif;
    font-size: 17px;
    font-weight: 800;
    line-height: 1.3;
    color: white;
    margin-bottom: 10px;
  }
  .story .meta {
    color: var(--pr-text-dim);
    font-size: 12px;
    display: flex;
    gap: 8px;
    align-items: center;
  }
  .story .meta .author {
    display: flex;
    align-items: center;
    gap: 6px;
  }
  .story .meta .avatar {
    width: 20px; height: 20px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--pr-sky), var(--pr-sky-deep));
    color: var(--pr-navy);
    display: grid;
    place-items: center;
    font-weight: 800;
    font-size: 10px;
  }

  .story.feature { grid-column: span 2; }
  .story.feature .thumb { aspect-ratio: 16/8; }
  .story.feature h3 { font-size: 22px; }

  /* ==========================================
     8. PA QUE SEPA — Video series strip
     ========================================== */
  .video-strip {
    background: linear-gradient(180deg, var(--pr-navy-2) 0%, var(--pr-navy) 100%);
    padding: 60px 0;
    margin: 40px 0;
    position: relative;
    overflow: hidden;
  }
  .video-strip::before {
    content:"";
    position: absolute;
    width: 600px; height: 600px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(79,195,247,0.15) 0%, transparent 70%);
    top: -300px; right: -200px;
    pointer-events: none;
  }
  .video-strip .wrap {
    max-width: var(--container);
    margin: 0 auto;
    padding: 0 24px;
    position: relative;
  }
  .video-strip .label-row {
    display: flex;
    justify-content: space-between;
    align-items: end;
    margin-bottom: 28px;
  }
  .video-strip .label {
    color: var(--pr-sky);
    font-size: 12px;
    font-weight: 800;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    margin-bottom: 8px;
  }
  .video-strip h2 {
    font-family: 'Archivo Black', sans-serif;
    font-size: clamp(32px, 3.5vw, 48px);
    line-height: 1;
    letter-spacing: -0.02em;
  }
  .video-strip h2 em {
    color: var(--pr-sky);
    font-style: normal;
  }
  .video-strip p {
    color: var(--pr-text-mute);
    font-size: 14px;
    max-width: 480px;
    margin-top: 12px;
  }
  .video-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 18px;
  }
  .video-card {
    border-radius: var(--radius);
    overflow: hidden;
    aspect-ratio: 9/13;
    position: relative;
    cursor: pointer;
    background: var(--pr-navy-3);
    transition: 0.3s;
  }
  .video-card:hover { transform: scale(1.02); }
  .video-card::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(180deg, transparent 40%, rgba(0,0,0,0.85));
  }
  .video-card.v1 { background: linear-gradient(180deg, #0B2545, var(--pr-red)); }
  .video-card.v2 { background: linear-gradient(180deg, var(--pr-sky-deep), #0B2545); }
  .video-card.v3 { background: linear-gradient(180deg, var(--pr-navy-2), #ff8c42); }
  .video-card.v4 { background: linear-gradient(180deg, #2d3a4d, var(--pr-sky)); }
  .video-card .play {
    position: absolute;
    top: 50%; left: 50%;
    transform: translate(-50%,-50%);
    width: 64px; height: 64px;
    border-radius: 50%;
    background: rgba(255,255,255,0.92);
    display: grid;
    place-items: center;
    color: var(--pr-navy);
    z-index: 2;
    transition: 0.3s;
  }
  .video-card:hover .play {
    background: var(--pr-sky);
    transform: translate(-50%,-50%) scale(1.1);
  }
  .video-card .info {
    position: absolute;
    bottom: 0; left: 0; right: 0;
    padding: 18px;
    z-index: 2;
  }
  .video-card .ep {
    font-size: 10px;
    font-weight: 800;
    letter-spacing: 0.16em;
    color: var(--pr-sky-glow);
    text-transform: uppercase;
    margin-bottom: 6px;
  }
  .video-card h4 {
    font-family: 'Manrope', sans-serif;
    font-weight: 800;
    color: white;
    font-size: 16px;
    line-height: 1.25;
  }

  /* ==========================================
     9. STATS / DATA SLAB (NFL.com inspired)
     ========================================== */
  .stats-slab {
    background:
      linear-gradient(135deg, rgba(79,195,247,0.08), transparent 60%),
      var(--pr-navy-2);
    border: 1px solid var(--pr-line);
    border-radius: var(--radius-xl);
    padding: 36px;
    display: grid;
    grid-template-columns: 1.2fr 2fr;
    gap: 36px;
    align-items: center;
  }
  .stats-slab .left .label {
    color: var(--pr-sky);
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    margin-bottom: 10px;
  }
  .stats-slab .left h3 {
    font-family: 'Archivo Black', sans-serif;
    font-size: 28px;
    line-height: 1.05;
    margin-bottom: 12px;
    letter-spacing: -0.01em;
  }
  .stats-slab .left p {
    color: var(--pr-text-mute);
    font-size: 14px;
  }
  .stats-grid {
    display: grid;
    grid-template-columns: repeat(4,1fr);
    gap: 20px;
  }
  .stat {
    background: rgba(3,16,31,0.6);
    border: 1px solid var(--pr-line);
    border-radius: var(--radius);
    padding: 18px;
    transition: 0.2s;
  }
  .stat:hover { border-color: var(--pr-sky); }
  .stat .name {
    font-size: 11px;
    color: var(--pr-text-dim);
    letter-spacing: 0.08em;
    text-transform: uppercase;
    margin-bottom: 6px;
    font-weight: 700;
  }
  .stat .num {
    font-family: 'Archivo Black', sans-serif;
    font-size: 32px;
    color: var(--pr-sky);
    font-variant-numeric: tabular-nums;
    line-height: 1;
  }
  .stat .delta {
    font-size: 11px;
    color: #6BD391;
    font-weight: 700;
    margin-top: 6px;
  }
  .stat .delta.down { color: var(--pr-red-glow); }

  /* ==========================================
     10. ARTICLE PAGE
     ========================================== */
  .article-hero {
    max-width: 1100px;
    margin: 40px auto 0;
    padding: 0 24px;
    text-align: center;
  }
  .article-hero .crumb {
    font-size: 12px;
    color: var(--pr-text-dim);
    letter-spacing: 0.08em;
    margin-bottom: 16px;
  }
  .article-hero .crumb a { color: var(--pr-sky); font-weight: 700; }
  .article-hero h1 {
    font-family: 'Archivo Black', sans-serif;
    font-size: clamp(32px, 4.5vw, 64px);
    letter-spacing: -0.02em;
    line-height: 1.05;
    margin-bottom: 20px;
    max-width: 1000px;
    margin-left: auto;
    margin-right: auto;
  }
  .article-hero .deck {
    color: var(--pr-text-mute);
    font-size: clamp(16px, 1.4vw, 20px);
    line-height: 1.5;
    max-width: 720px;
    margin: 0 auto 28px;
    font-family: 'Manrope', sans-serif;
    font-weight: 400;
  }
  .article-byline {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 16px;
    color: var(--pr-text-mute);
    font-size: 13px;
    flex-wrap: wrap;
  }
  .article-byline .author-chip {
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .article-byline .avatar-lg {
    width: 36px; height: 36px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--pr-sky), var(--pr-sky-deep));
    color: var(--pr-navy);
    font-weight: 800;
    display: grid;
    place-items: center;
    font-size: 13px;
  }
  .article-byline .by-name { color: white; font-weight: 700; }
  .article-byline .sep { color: var(--pr-line-strong); }
  .article-image {
    max-width: 1200px;
    margin: 32px auto;
    padding: 0 24px;
  }
  .article-image .frame {
    border-radius: var(--radius-xl);
    overflow: hidden;
    aspect-ratio: 16/9;
    background:
      radial-gradient(ellipse at center, rgba(79,195,247,0.4) 0%, transparent 60%),
      linear-gradient(135deg, var(--pr-navy-2), #061427);
    position: relative;
  }
  .article-image .frame::before {
    content:"";
    position: absolute;
    inset: 0;
    background:
      radial-gradient(circle at 20% 70%, rgba(255,255,255,0.06), transparent 50%),
      radial-gradient(circle at 80% 30%, rgba(79,195,247,0.18), transparent 50%);
  }
  .article-image .caption {
    color: var(--pr-text-dim);
    font-size: 12px;
    margin-top: 10px;
    text-align: center;
    font-style: italic;
  }
  .article-body {
    max-width: 720px;
    margin: 0 auto;
    padding: 0 24px 60px;
    font-family: 'Manrope', sans-serif;
    font-size: 18px;
    line-height: 1.75;
    color: #D6E1ED;
  }
  .article-body p { margin-bottom: 22px; }
  .article-body p:first-of-type::first-letter {
    font-family: 'Archivo Black', sans-serif;
    font-size: 64px;
    line-height: 0.9;
    color: var(--pr-sky);
    float: left;
    padding: 6px 12px 0 0;
  }
  .article-body h2 {
    font-family: 'Archivo Black', sans-serif;
    font-size: 28px;
    margin: 36px 0 16px;
    color: white;
    letter-spacing: -0.01em;
  }
  .article-body blockquote {
    margin: 32px 0;
    padding: 24px 28px;
    border-left: 4px solid var(--pr-sky);
    background: rgba(79,195,247,0.06);
    border-radius: 0 var(--radius) var(--radius) 0;
    font-family: 'Archivo Black', sans-serif;
    font-size: 22px;
    line-height: 1.35;
    color: white;
  }
  .article-body blockquote cite {
    display: block;
    margin-top: 12px;
    font-family: 'Inter', sans-serif;
    font-style: normal;
    font-size: 13px;
    color: var(--pr-text-mute);
    font-weight: 600;
  }
  .article-share {
    max-width: 720px;
    margin: 0 auto;
    padding: 0 24px 40px;
    display: flex;
    gap: 12px;
    align-items: center;
    border-top: 1px solid var(--pr-line);
    padding-top: 28px;
  }
  .article-share .label {
    font-size: 12px;
    font-weight: 800;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    color: var(--pr-text-mute);
  }

  /* Related stories sidebar inline */
  .related {
    max-width: var(--container);
    margin: 20px auto 60px;
    padding: 0 24px;
  }

  /* ==========================================
     11. SCORES PAGE (data-heavy)
     ========================================== */
  .scores-shell {
    max-width: var(--container);
    margin: 24px auto;
    padding: 0 24px;
    display: grid;
    grid-template-columns: 240px 1fr;
    gap: 28px;
  }
  .league-rail {
    background: var(--pr-navy-2);
    border: 1px solid var(--pr-line);
    border-radius: var(--radius-lg);
    padding: 18px;
    height: fit-content;
    position: sticky;
    top: 96px;
  }
  .league-rail .head {
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 0.16em;
    text-transform: uppercase;
    color: var(--pr-text-dim);
    margin-bottom: 14px;
  }
  .league-rail a {
    display: flex;
    justify-content: space-between;
    padding: 10px 12px;
    border-radius: 8px;
    font-size: 13px;
    font-weight: 700;
    color: var(--pr-text-mute);
    transition: 0.15s;
    margin-bottom: 4px;
  }
  .league-rail a:hover {
    background: rgba(79,195,247,0.08);
    color: white;
  }
  .league-rail a.active {
    background: var(--pr-sky);
    color: var(--pr-navy);
  }
  .league-rail a .badge-num {
    background: rgba(0,0,0,0.2);
    color: inherit;
    font-size: 10px;
    padding: 2px 6px;
    border-radius: 4px;
    font-weight: 800;
  }
  .league-rail a:not(.active) .badge-num { background: var(--pr-line); }

  .scores-main { display: flex; flex-direction: column; gap: 28px; }

  .date-pills {
    display: flex;
    gap: 8px;
    overflow-x: auto;
    padding-bottom: 4px;
  }
  .date-pills::-webkit-scrollbar { display: none; }
  .date-pill {
    padding: 10px 14px;
    border-radius: 10px;
    border: 1px solid var(--pr-line-strong);
    font-size: 12px;
    font-weight: 700;
    color: var(--pr-text-mute);
    text-align: center;
    flex-shrink: 0;
    min-width: 72px;
    transition: 0.2s;
  }
  .date-pill:hover { border-color: var(--pr-sky); }
  .date-pill.active {
    background: var(--pr-sky);
    color: var(--pr-navy);
    border-color: var(--pr-sky);
  }
  .date-pill .day { display: block; font-size: 14px; font-weight: 800; line-height: 1; margin-top: 2px; color: inherit; }
  .date-pill.active .day { color: var(--pr-navy); }

  /* Scoreboard cards */
  .games-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
    gap: 14px;
  }
  .game-card {
    background: var(--pr-navy-2);
    border: 1px solid var(--pr-line);
    border-radius: var(--radius);
    overflow: hidden;
    transition: 0.2s;
    cursor: pointer;
  }
  .game-card:hover { border-color: var(--pr-sky); transform: translateY(-1px); }
  .game-card .top {
    display: flex;
    justify-content: space-between;
    padding: 10px 14px;
    border-bottom: 1px solid var(--pr-line);
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    color: var(--pr-text-dim);
  }
  .game-card.live .top .right {
    color: var(--pr-red-glow);
  }
  .game-card .team-row {
    display: grid;
    grid-template-columns: 32px 1fr 60px 50px;
    align-items: center;
    gap: 12px;
    padding: 14px;
    border-bottom: 1px dashed var(--pr-line);
  }
  .game-card .team-row:last-of-type { border-bottom: none; }
  .game-card .logo-tile {
    width: 32px; height: 32px;
    border-radius: 8px;
    background: linear-gradient(135deg, var(--pr-sky-deep), var(--pr-navy-3));
    display: grid;
    place-items: center;
    font-family: 'Archivo Black', sans-serif;
    font-size: 11px;
    color: white;
  }
  .game-card .team-name { font-weight: 700; font-size: 14px; }
  .game-card .team-record { font-size: 11px; color: var(--pr-text-dim); }
  .game-card .pitcher {
    font-size: 11px;
    color: var(--pr-text-mute);
    text-align: right;
  }
  .game-card .score {
    font-family: 'Archivo Black', sans-serif;
    font-size: 22px;
    text-align: right;
    color: white;
    font-variant-numeric: tabular-nums;
  }
  .game-card .team-row.win .score { color: var(--pr-sky); }
  .game-card .team-row.lose .team-name { color: var(--pr-text-mute); }

  /* Standings table */
  .standings-card {
    background: var(--pr-navy-2);
    border: 1px solid var(--pr-line);
    border-radius: var(--radius-lg);
    overflow: hidden;
  }
  .standings-card .head {
    padding: 18px 22px;
    border-bottom: 1px solid var(--pr-line);
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .standings-card h3 {
    font-family: 'Archivo Black', sans-serif;
    font-size: 18px;
    letter-spacing: -0.01em;
  }
  .standings-card table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13px;
    font-variant-numeric: tabular-nums;
  }
  .standings-card thead th {
    text-align: left;
    padding: 12px 14px;
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    color: var(--pr-text-dim);
    background: rgba(0,0,0,0.2);
    border-bottom: 1px solid var(--pr-line);
  }
  .standings-card thead th.num,
  .standings-card tbody td.num {
    text-align: right;
  }
  .standings-card tbody tr {
    transition: 0.15s;
    cursor: pointer;
  }
  .standings-card tbody tr:hover { background: rgba(79,195,247,0.05); }
  .standings-card tbody td {
    padding: 12px 14px;
    border-bottom: 1px solid var(--pr-line);
  }
  .standings-card tbody td:first-child {
    color: var(--pr-text-dim);
    font-weight: 800;
    width: 40px;
  }
  .standings-card tbody tr.lead td:first-child { color: var(--pr-sky); }
  .standings-card tbody td.team-cell {
    display: flex;
    gap: 10px;
    align-items: center;
    font-weight: 700;
  }
  .standings-card tbody td .mini-logo {
    width: 24px; height: 24px;
    border-radius: 6px;
    background: linear-gradient(135deg, var(--pr-sky-deep), var(--pr-navy-3));
    display: grid;
    place-items: center;
    font-size: 9px;
    font-family: 'Archivo Black', sans-serif;
    color: white;
  }
  .form-dots { display: inline-flex; gap: 4px; }
  .form-dots span {
    width: 16px; height: 16px;
    border-radius: 4px;
    font-size: 10px;
    display: grid;
    place-items: center;
    font-weight: 800;
    color: white;
  }
  .form-dots .w { background: var(--pr-sky); color: var(--pr-navy); }
  .form-dots .l { background: rgba(255,255,255,0.12); color: var(--pr-text-mute); }

  /* ==========================================
     12. CATEGORY LANDING PAGE
     ========================================== */
  .cat-banner {
    position: relative;
    max-width: var(--container);
    margin: 24px auto;
    padding: 0 24px;
  }
  .cat-banner .frame {
    border-radius: var(--radius-xl);
    background:
      radial-gradient(ellipse at right, rgba(79,195,247,0.22), transparent 60%),
      linear-gradient(135deg, #061427 0%, #0B2545 100%);
    padding: 56px 48px;
    border: 1px solid var(--pr-line);
    overflow: hidden;
    position: relative;
    display: grid;
    grid-template-columns: 1.5fr 1fr;
    gap: 32px;
    align-items: center;
  }
  .cat-banner .frame::before {
    content: "";
    position: absolute;
    right: -100px;
    top: -100px;
    width: 400px; height: 400px;
    border-radius: 50%;
    border: 2px solid rgba(79,195,247,0.12);
  }
  .cat-banner .frame::after {
    content: "";
    position: absolute;
    right: -50px;
    bottom: -120px;
    width: 280px; height: 280px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(79,195,247,0.18), transparent 70%);
  }
  .cat-banner .label {
    color: var(--pr-sky);
    font-size: 12px;
    letter-spacing: 0.2em;
    font-weight: 800;
    text-transform: uppercase;
    margin-bottom: 12px;
  }
  .cat-banner h1 {
    font-family: 'Archivo Black', sans-serif;
    font-size: clamp(42px, 5vw, 76px);
    line-height: 0.95;
    letter-spacing: -0.025em;
    margin-bottom: 16px;
  }
  .cat-banner h1 em {
    color: var(--pr-sky);
    font-style: normal;
  }
  .cat-banner p {
    color: var(--pr-text-mute);
    font-size: 15px;
    max-width: 480px;
    margin-bottom: 24px;
    line-height: 1.6;
  }
  .cat-stats {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 12px;
    position: relative;
    z-index: 2;
  }
  .cat-stat {
    background: rgba(3,16,31,0.6);
    border: 1px solid var(--pr-line);
    border-radius: var(--radius);
    padding: 18px;
    backdrop-filter: blur(10px);
  }
  .cat-stat .lbl {
    font-size: 10px;
    letter-spacing: 0.16em;
    color: var(--pr-text-dim);
    text-transform: uppercase;
    font-weight: 700;
  }
  .cat-stat .val {
    font-family: 'Archivo Black', sans-serif;
    font-size: 28px;
    color: var(--pr-sky);
    line-height: 1;
    margin-top: 6px;
  }

  .cat-toolbar {
    max-width: var(--container);
    margin: 0 auto;
    padding: 0 24px;
    display: flex;
    justify-content: space-between;
    gap: 16px;
    flex-wrap: wrap;
    align-items: center;
    margin-bottom: 24px;
  }
  .filter-row {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
  }
  .sort-select {
    background: var(--pr-navy-2);
    border: 1px solid var(--pr-line-strong);
    color: var(--pr-text);
    padding: 9px 14px;
    border-radius: 10px;
    font-size: 13px;
    font-weight: 600;
  }

  /* ==========================================
     13. FOOTER
     ========================================== */
  footer.site {
    background: #03101F;
    border-top: 1px solid var(--pr-line);
    padding: 60px 24px 24px;
    margin-top: 60px;
  }
  footer.site .wrap {
    max-width: var(--container);
    margin: 0 auto;
    display: grid;
    grid-template-columns: 1.4fr 1fr 1fr 1fr;
    gap: 40px;
    padding-bottom: 32px;
    border-bottom: 1px solid var(--pr-line);
  }
  footer.site h4 {
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 0.16em;
    text-transform: uppercase;
    color: var(--pr-sky);
    margin-bottom: 16px;
  }
  footer.site .links { display: flex; flex-direction: column; gap: 10px; }
  footer.site a {
    color: var(--pr-text-mute);
    font-size: 14px;
    transition: 0.15s;
  }
  footer.site a:hover { color: var(--pr-sky); }
  footer.site .brand p {
    color: var(--pr-text-mute);
    font-size: 14px;
    margin-top: 14px;
    line-height: 1.6;
    max-width: 320px;
  }
  footer.site .socials { display: flex; gap: 8px; margin-top: 16px; }
  footer.site .socials a {
    width: 40px; height: 40px;
    border-radius: 10px;
    border: 1px solid var(--pr-line);
    display: grid;
    place-items: center;
  }
  footer.site .socials a:hover {
    border-color: var(--pr-sky);
    background: rgba(79,195,247,0.08);
    color: var(--pr-sky);
  }
  footer.site .copy {
    max-width: var(--container);
    margin: 24px auto 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: var(--pr-text-dim);
    font-size: 12px;
    flex-wrap: wrap;
    gap: 8px;
  }

  /* ==========================================
     14. RESPONSIVE
     ========================================== */
  @media (max-width: 1024px) {
    .hero { grid-template-columns: 1fr; }
    .hero-side { grid-template-rows: none; grid-template-columns: 1fr 1fr; }
    .stats-slab { grid-template-columns: 1fr; }
    .stats-grid { grid-template-columns: repeat(2,1fr); }
    .scores-shell { grid-template-columns: 1fr; }
    .league-rail { position: static; }
    .cat-banner .frame { grid-template-columns: 1fr; padding: 36px 24px; }
    footer.site .wrap { grid-template-columns: 1fr 1fr; }
  }
  @media (max-width: 640px) {
    nav.primary { gap: 0; }
    nav.primary a { padding: 10px 10px; font-size: 11px; }
    .hero-side { grid-template-columns: 1fr; }
    .story.feature { grid-column: span 1; }
    .stats-grid { grid-template-columns: 1fr 1fr; }
    .article-hero h1 { font-size: 32px; }
    footer.site .wrap { grid-template-columns: 1fr; }
    .util-bar .left .hide-mobile { display: none; }
  }

  /* Subtle PR flag stripe accent in header bottom */
  .flag-stripe {
    height: 3px;
    background: linear-gradient(
      90deg,
      var(--pr-sky) 0%, var(--pr-sky) 33%,
      var(--pr-white) 33%, var(--pr-white) 66%,
      var(--pr-red) 66%, var(--pr-red) 100%
    );
    opacity: 0.85;
  }
</style>
</head>
<body>

<!-- ==========================================
     UTILITY BAR
     ========================================== -->
<div class="util-bar">
  <div class="wrap">
    <div class="left">
      <span class="hide-mobile">Thursday, April 30, 2026</span>
      <span class="live-pill">LIVE</span>
      <span>Yankees vs. Rangers · BOT 7th</span>
    </div>
    <div class="right">
      <div class="lang">
        <button class="active">EN</button>
        <button>ES</button>
      </div>
      <a href="#">Newsletter</a>
      <a href="#">Sign In</a>
    </div>
  </div>
</div>

<!-- ==========================================
     SCORE TICKER
     ========================================== -->
<div class="ticker">
  <div class="wrap">
    <div class="label">SCORES</div>
    <div class="ticker-track">
      <div class="ticker-game live">
        <div class="league">MLB</div>
        <div class="teams">
          <div class="row win"><span class="name">NYY</span><span class="score">7</span></div>
          <div class="row"><span class="name">TEX</span><span class="score">4</span></div>
        </div>
        <div class="status">7th</div>
      </div>
      <div class="ticker-game">
        <div class="league">MLB</div>
        <div class="teams">
          <div class="row win"><span class="name">BOS</span><span class="score">9</span></div>
          <div class="row"><span class="name">TOR</span><span class="score">3</span></div>
        </div>
        <div class="status">FINAL</div>
      </div>
      <div class="ticker-game live">
        <div class="league">NBA</div>
        <div class="teams">
          <div class="row"><span class="name">LAL</span><span class="score">88</span></div>
          <div class="row win"><span class="name">DEN</span><span class="score">94</span></div>
        </div>
        <div class="status">Q4 · 4:21</div>
      </div>
      <div class="ticker-game">
        <div class="league">BOX</div>
        <div class="teams">
          <div class="row"><span class="name">López</span><span class="score">—</span></div>
          <div class="row"><span class="name">Berchelt</span><span class="score">—</span></div>
        </div>
        <div class="status">SAT 8PM</div>
      </div>
      <div class="ticker-game">
        <div class="league">NFL</div>
        <div class="teams">
          <div class="row win"><span class="name">KC</span><span class="score">31</span></div>
          <div class="row"><span class="name">BUF</span><span class="score">24</span></div>
        </div>
        <div class="status">FINAL</div>
      </div>
      <div class="ticker-game">
        <div class="league">SOC</div>
        <div class="teams">
          <div class="row"><span class="name">PR</span><span class="score">2</span></div>
          <div class="row win"><span class="name">MEX</span><span class="score">3</span></div>
        </div>
        <div class="status">FT</div>
      </div>
      <div class="ticker-game">
        <div class="league">MLB</div>
        <div class="teams">
          <div class="row"><span class="name">NYM</span><span class="score">2</span></div>
          <div class="row win"><span class="name">ATL</span><span class="score">5</span></div>
        </div>
        <div class="status">FINAL</div>
      </div>
    </div>
  </div>
</div>

<!-- ==========================================
     HEADER
     ========================================== -->
<header class="main">
  <div class="wrap">
    <a href="#home" class="logo" data-route="home">
      <div class="mark">L</div>
      <div>
        <div class="word">LATINO<span class="sport">SPORTS</span></div>
        <div class="tag">Latin Athletes · Latino Legends · Deportes</div>
      </div>
    </a>
    <nav class="primary">
      <a href="#home"     data-route="home"     class="active">Home</a>
      <a href="#category" data-route="category">MLB</a>
      <a href="#category" data-route="category">NBA</a>
      <a href="#category" data-route="category">NFL</a>
      <a href="#category" data-route="category" class="has-new">Boxing</a>
      <a href="#category" data-route="category">Soccer</a>
      <a href="#category" data-route="category">College</a>
      <a href="#scores"   data-route="scores">Scores</a>
      <a href="#article"  data-route="article">Article</a>
      <a href="#home"     data-route="home">Pa Que Sepa</a>
    </nav>
    <div class="header-actions">
      <button class="icon-btn" aria-label="Search">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
      </button>
      <button class="btn-primary">Subscribe</button>
    </div>
  </div>
  <div class="flag-stripe"></div>
</header>

<!-- ==========================================
     PAGE: HOME
     ========================================== -->
<div class="page active" id="page-home">

  <!-- HERO -->
  <section class="hero">
    <article class="hero-main" data-route="article">
      <div class="badge-row">
        <span class="badge sport">MLB · YANKEES</span>
        <span class="badge live">LIVE</span>
      </div>
      <div class="body">
        <h1>The Comeback Yankees Are For Real — Bronx Bombers Erase Four-Run Deficit, Improve to 7-1</h1>
        <div class="meta">
          <span><strong>Rich Mancuso</strong></span>
          <span class="dot">●</span>
          <span>Senior Writer</span>
          <span class="dot">●</span>
          <span>4 min read</span>
          <span class="dot">●</span>
          <span>2.4k reading now</span>
        </div>
      </div>
    </article>

    <aside class="hero-side">
      <article class="hero-card" data-route="article">
        <div class="visual boxing">
          <div class="badge-row">
            <span class="badge sport">BOXING</span>
          </div>
        </div>
        <div class="body">
          <h3>López Returns to PR for Title Defense — "This Is For My People"</h3>
          <div class="meta">Boxing · 2 hr ago</div>
        </div>
      </article>
      <article class="hero-card" data-route="article">
        <div class="visual basketball">
          <div class="badge-row">
            <span class="badge sport">NBA · PLAYOFFS</span>
          </div>
        </div>
        <div class="body">
          <h3>Jokić's Triple-Double Sinks Lakers as Nuggets Take 2-0 Series Lead</h3>
          <div class="meta">NBA · 35 min ago</div>
        </div>
      </article>
    </aside>
  </section>

  <!-- TOP STORIES -->
  <section class="section">
    <div class="section-head">
      <h2>Top Stories</h2>
      <div class="actions">
        <button class="filter-pill active">All</button>
        <button class="filter-pill">MLB</button>
        <button class="filter-pill">NBA</button>
        <button class="filter-pill">Boxing</button>
        <button class="filter-pill">NFL</button>
        <button class="filter-pill">Soccer</button>
      </div>
    </div>

    <div class="stories-grid">
      <article class="story feature" data-route="article">
        <div class="thumb">
          <div class="badge-row">
            <span class="badge sport">FEATURED</span>
          </div>
          <div class="duration">VIDEO · 3:42</div>
        </div>
        <div class="body">
          <div class="category">Pa Que Sepa</div>
          <h3>Inside Edwin Díaz's Off-Season: Trumpets, Training, and the Pressure of October</h3>
          <div class="meta">
            <span class="author"><span class="avatar">AM</span> Andrés Marrero</span>
            <span>·</span>
            <span>5 hr ago</span>
          </div>
        </div>
      </article>

      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Yankees</div>
          <h3>Jasson Domínguez Exits With Bruised Elbow — X-Rays Negative</h3>
          <div class="meta">
            <span class="author"><span class="avatar">RM</span> Rich Mancuso</span>
            <span>·</span>
            <span>1 hr ago</span>
          </div>
        </div>
      </article>

      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">BOXING</span></div></div>
        <div class="body">
          <div class="category">Boxing · Title Bout</div>
          <h3>Inside the Numbers: Why Berchelt-López Is the Most Anticipated Latino Card of 2026</h3>
          <div class="meta">
            <span class="author"><span class="avatar">JS</span> J. Santos</span>
            <span>·</span>
            <span>3 hr ago</span>
          </div>
        </div>
      </article>

      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">NBA</span></div></div>
        <div class="body">
          <div class="category">NBA · Playoffs</div>
          <h3>Karl-Anthony Towns Drops 38, Knicks Even Series With Boston</h3>
          <div class="meta">
            <span class="author"><span class="avatar">LV</span> Luis Vega</span>
            <span>·</span>
            <span>6 hr ago</span>
          </div>
        </div>
      </article>

      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">SOCCER</span></div></div>
        <div class="body">
          <div class="category">Concacaf</div>
          <h3>Puerto Rico National Team Falls to Mexico in Friendly, Shows Promise</h3>
          <div class="meta">
            <span class="author"><span class="avatar">CR</span> C. Rivera</span>
            <span>·</span>
            <span>8 hr ago</span>
          </div>
        </div>
      </article>

      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Mets</div>
          <h3>Suárez's Power Surge Has the Mets Reconsidering the Lineup Order</h3>
          <div class="meta">
            <span class="author"><span class="avatar">RM</span> Rich Mancuso</span>
            <span>·</span>
            <span>Yesterday</span>
          </div>
        </div>
      </article>

      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">NFL</span></div></div>
        <div class="body">
          <div class="category">Draft</div>
          <h3>Draft Day Recap: Latino Standouts Headed to the League's Brightest Stages</h3>
          <div class="meta">
            <span class="author"><span class="avatar">EM</span> E. Morales</span>
            <span>·</span>
            <span>Yesterday</span>
          </div>
        </div>
      </article>
    </div>
  </section>

  <!-- PA QUE SEPA video strip -->
  <section class="video-strip">
    <div class="wrap">
      <div class="label-row">
        <div>
          <div class="label">▶ Original Series</div>
          <h2>Pa Que <em>Sepa</em></h2>
          <p>In-depth interviews with rising Latino sports personalities. Candid conversations, exclusive access — only on Latino Sports.</p>
        </div>
        <div class="actions">
          <button class="filter-pill">All Episodes →</button>
        </div>
      </div>
      <div class="video-grid">
        <div class="video-card v1">
          <div class="play"><svg width="22" height="22" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg></div>
          <div class="info">
            <div class="ep">EP 24 · 18 min</div>
            <h4>Edwin Díaz on Trumpets, Tampa, and Closing Out October</h4>
          </div>
        </div>
        <div class="video-card v2">
          <div class="play"><svg width="22" height="22" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg></div>
          <div class="info">
            <div class="ep">EP 23 · 22 min</div>
            <h4>Teófimo López: Untouchable Confidence Before the López-Berchelt Card</h4>
          </div>
        </div>
        <div class="video-card v3">
          <div class="play"><svg width="22" height="22" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg></div>
          <div class="info">
            <div class="ep">EP 22 · 14 min</div>
            <h4>Karl-Anthony Towns on Roots, Responsibility, and the Playoffs</h4>
          </div>
        </div>
        <div class="video-card v4">
          <div class="play"><svg width="22" height="22" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg></div>
          <div class="info">
            <div class="ep">EP 21 · 19 min</div>
            <h4>Jasson Domínguez: From the DR to the Bronx, the Long Way Up</h4>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- STATS SLAB -->
  <section class="section">
    <div class="stats-slab">
      <div class="left">
        <div class="label">By the Numbers</div>
        <h3>The 2026 Yankees Are Off to a Historic Start</h3>
        <p>A 7–1 opening matches the franchise's best start in over a decade. Here's the data driving the conversation.</p>
      </div>
      <div class="stats-grid">
        <div class="stat">
          <div class="name">RECORD</div>
          <div class="num">7-1</div>
          <div class="delta">+3 GB AL East</div>
        </div>
        <div class="stat">
          <div class="name">TEAM OPS</div>
          <div class="num">.842</div>
          <div class="delta">1st AL</div>
        </div>
        <div class="stat">
          <div class="name">Rotation ERA</div>
          <div class="num">2.91</div>
          <div class="delta">2nd MLB</div>
        </div>
        <div class="stat">
          <div class="name">Comebacks</div>
          <div class="num">2</div>
          <div class="delta">Most in MLB</div>
        </div>
      </div>
    </div>
  </section>

  <!-- LATEST -->
  <section class="section">
    <div class="section-head">
      <h2>Latest News</h2>
      <div class="actions">
        <button class="filter-pill">View All →</button>
      </div>
    </div>
    <div class="stories-grid">
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">COLLEGE</span></div></div>
        <div class="body">
          <div class="category">NCAA</div>
          <h3>UPR Río Piedras Advances to Championship Final</h3>
          <div class="meta"><span class="author"><span class="avatar">DC</span> Diego Cruz</span><span>·</span><span>2 hr ago</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Marlins</div>
          <h3>Marlins Activate Rookie Pitcher From IL Ahead of Series</h3>
          <div class="meta"><span class="author"><span class="avatar">PT</span> P. Torres</span><span>·</span><span>3 hr ago</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">SOCCER</span></div></div>
        <div class="body">
          <div class="category">La Liga</div>
          <h3>Real Madrid Eyes Latin American Phenom in Summer Window</h3>
          <div class="meta"><span class="author"><span class="avatar">MS</span> M. Salgado</span><span>·</span><span>4 hr ago</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">BOXING</span></div></div>
        <div class="body">
          <div class="category">Boxing</div>
          <h3>Tale of the Tape: Side-By-Side Breakdown of Saturday's Title Fight</h3>
          <div class="meta"><span class="author"><span class="avatar">JS</span> J. Santos</span><span>·</span><span>6 hr ago</span></div>
        </div>
      </article>
    </div>
  </section>
</div>

<!-- ==========================================
     PAGE: ARTICLE
     ========================================== -->
<div class="page" id="page-article">
  <section class="article-hero">
    <div class="crumb">
      <a href="#" data-route="home">Home</a> ›
      <a href="#" data-route="category">MLB</a> ›
      <a href="#" data-route="category">Yankees</a>
    </div>
    <h1>The Comeback Yankees Are For Real — Bronx Bombers Erase Four-Run Deficit, Improve to 7-1</h1>
    <p class="deck">Saturday's 9-7 win extended the Yankees' best opening stretch in over a decade. With two come-from-behind victories already on the board, the 2026 club is showing late-inning resilience that's quietly becoming its identity.</p>
    <div class="article-byline">
      <div class="author-chip">
        <div class="avatar-lg">RM</div>
        <div>
          <div class="by-name">Rich Mancuso</div>
          <div>Senior Writer · Latino Sports since 2003</div>
        </div>
      </div>
      <span class="sep">|</span>
      <span>April 30, 2026</span>
      <span class="sep">|</span>
      <span>4 min read</span>
    </div>
  </section>

  <div class="article-image">
    <div class="frame"></div>
    <div class="caption">Photo: Bill Menzel / Latino Sports — Yankee Stadium, Bronx, NY</div>
  </div>

  <article class="article-body">
    <p>The Yankees' 9-7 win and 7-1 start to the 2026 season matches their best in franchise history. Saturday night ended with the Yankees' second comeback in their first eight games, and largest come-from-behind win since July 19 of last year at Atlanta — where they erased a five-run deficit.</p>

    <p>After trailing 4-0 in the fourth, the Bronx Bombers played comeback baseball — scoring two runs in the fifth, three in the sixth, a run in the seventh, and three more in the eighth. The bullpen held; the bats refused to quit.</p>

    <h2>An Identity Forming Early</h2>
    <p>What stands out isn't just the record. It's the way the wins are arriving. Two of the seven have required the lineup to claw back from multi-run holes. Manager Aaron Boone called it "a different kind of belief" in the post-game.</p>

    <blockquote>
      "When we got down four, nobody changed in that dugout. That's the part you can't teach."
      <cite>— Aaron Boone, postgame</cite>
    </blockquote>

    <p>Jasson Domínguez exited the game in the seventh with a bruised elbow after fouling a ball off himself, but x-rays were negative. He's listed as day-to-day. With the Yankees rolling and the AL East already showing some daylight at the top, the next ten games will tell us whether April was a hot start or the early stretch of something larger.</p>

    <h2>The Latino Sports Angle</h2>
    <p>Three of the Yankees' standout contributors over this stretch — Domínguez, Soto, and Volpe — are products of Latin American development pipelines. As a result, the club's profile in Caribbean broadcast territories has surged: Latino Sports' streaming partner reported a 38% lift in viewership across the first homestand alone.</p>

    <p>Whether it holds depends on the rotation. But for now, the Bronx is loud again, and the comebacks are starting to feel like a feature, not a fluke.</p>
  </article>

  <div class="article-share">
    <span class="label">Share</span>
    <button class="icon-btn" aria-label="X">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>
    </button>
    <button class="icon-btn" aria-label="Facebook">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M22.675 0H1.325C.593 0 0 .593 0 1.325v21.351C0 23.407.593 24 1.325 24H12.82v-9.294H9.692v-3.622h3.128V8.413c0-3.1 1.893-4.788 4.659-4.788 1.325 0 2.464.099 2.795.143v3.24h-1.918c-1.504 0-1.795.715-1.795 1.763v2.313h3.587l-.467 3.622h-3.12V24h6.116c.73 0 1.323-.593 1.323-1.325V1.325C24 .593 23.407 0 22.675 0z"/></svg>
    </button>
    <button class="icon-btn" aria-label="Link">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.72"/><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.72-1.72"/></svg>
    </button>
    <button class="icon-btn" aria-label="WhatsApp">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M.057 24l1.687-6.163a11.867 11.867 0 0 1-1.587-5.946C.16 5.335 5.495 0 12.05 0a11.817 11.817 0 0 1 8.413 3.488 11.824 11.824 0 0 1 3.48 8.414c-.003 6.557-5.338 11.892-11.893 11.892a11.9 11.9 0 0 1-5.688-1.448L.057 24zm6.597-3.807c1.676.995 3.276 1.591 5.392 1.592 5.448 0 9.886-4.434 9.889-9.885.002-5.462-4.415-9.89-9.881-9.892-5.452 0-9.887 4.434-9.889 9.884a9.86 9.86 0 0 0 1.512 5.265l-.999 3.648 3.976-1.044z"/></svg>
    </button>
  </div>

  <section class="related section">
    <div class="section-head">
      <h2>Related Stories</h2>
    </div>
    <div class="stories-grid">
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Yankees</div>
          <h3>Five Things We Learned From the Yankees' 7-1 Start</h3>
          <div class="meta"><span class="author"><span class="avatar">RM</span> Rich Mancuso</span><span>·</span><span>1 day ago</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Analysis</div>
          <h3>Why the Bullpen Has Been the Real Story</h3>
          <div class="meta"><span class="author"><span class="avatar">JS</span> J. Santos</span><span>·</span><span>2 days ago</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Photo Gallery</div>
          <h3>Yankees Home Opener — In Pictures</h3>
          <div class="meta"><span class="author"><span class="avatar">BM</span> Bill Menzel</span><span>·</span><span>1 week ago</span></div>
        </div>
      </article>
    </div>
  </section>
</div>

<!-- ==========================================
     PAGE: SCORES & STANDINGS
     ========================================== -->
<div class="page" id="page-scores">
  <section class="section">
    <div class="section-head">
      <h2>Scores · Standings · Schedule</h2>
      <div class="actions">
        <button class="filter-pill active">Today</button>
        <button class="filter-pill">Yesterday</button>
        <button class="filter-pill">This Week</button>
      </div>
    </div>
  </section>

  <div class="scores-shell">
    <aside class="league-rail">
      <div class="head">Leagues</div>
      <a href="#" class="active">MLB <span class="badge-num">12</span></a>
      <a href="#">NBA <span class="badge-num">8</span></a>
      <a href="#">NFL <span class="badge-num">—</span></a>
      <a href="#">Boxing <span class="badge-num">3</span></a>
      <a href="#">Soccer <span class="badge-num">14</span></a>
      <a href="#">College Basketball <span class="badge-num">22</span></a>
      <a href="#">College Football <span class="badge-num">—</span></a>
      <a href="#">PBR <span class="badge-num">2</span></a>
      <a href="#">Lacrosse <span class="badge-num">4</span></a>
    </aside>

    <div class="scores-main">

      <!-- Date pills -->
      <div class="date-pills">
        <button class="date-pill">Mon<span class="day">28</span></button>
        <button class="date-pill">Tue<span class="day">29</span></button>
        <button class="date-pill active">Today<span class="day">30</span></button>
        <button class="date-pill">Fri<span class="day">1</span></button>
        <button class="date-pill">Sat<span class="day">2</span></button>
        <button class="date-pill">Sun<span class="day">3</span></button>
        <button class="date-pill">Mon<span class="day">4</span></button>
      </div>

      <!-- Games grid -->
      <div class="games-grid">
        <div class="game-card live">
          <div class="top">
            <span>MLB · YANKEE STADIUM</span>
            <span class="right">● BOT 7TH</span>
          </div>
          <div class="team-row">
            <div class="logo-tile">TEX</div>
            <div>
              <div class="team-name">Rangers</div>
              <div class="team-record">12-9</div>
            </div>
            <div class="pitcher">Eovaldi (W)<br>4.2 IP, 7 H</div>
            <div class="score">4</div>
          </div>
          <div class="team-row win">
            <div class="logo-tile">NYY</div>
            <div>
              <div class="team-name">Yankees</div>
              <div class="team-record">7-1</div>
            </div>
            <div class="pitcher">Cole<br>5.0 IP, 6 H, 2 ER</div>
            <div class="score">7</div>
          </div>
        </div>

        <div class="game-card">
          <div class="top">
            <span>MLB · FENWAY PARK</span>
            <span class="right">FINAL</span>
          </div>
          <div class="team-row lose">
            <div class="logo-tile">TOR</div>
            <div>
              <div class="team-name">Blue Jays</div>
              <div class="team-record">10-12</div>
            </div>
            <div class="pitcher">Bassitt (L)<br>5.1 IP, 9 H</div>
            <div class="score">3</div>
          </div>
          <div class="team-row win">
            <div class="logo-tile">BOS</div>
            <div>
              <div class="team-name">Red Sox</div>
              <div class="team-record">14-7</div>
            </div>
            <div class="pitcher">Crochet (W)<br>7.0 IP, 11 K</div>
            <div class="score">9</div>
          </div>
        </div>

        <div class="game-card">
          <div class="top">
            <span>MLB · CITI FIELD</span>
            <span class="right">FINAL/10</span>
          </div>
          <div class="team-row lose">
            <div class="logo-tile">NYM</div>
            <div>
              <div class="team-name">Mets</div>
              <div class="team-record">11-10</div>
            </div>
            <div class="pitcher">Díaz (L, BS)<br>0.2 IP, 3 H</div>
            <div class="score">2</div>
          </div>
          <div class="team-row win">
            <div class="logo-tile">ATL</div>
            <div>
              <div class="team-name">Braves</div>
              <div class="team-record">15-6</div>
            </div>
            <div class="pitcher">Iglesias (W)<br>1.0 IP, 1 K</div>
            <div class="score">5</div>
          </div>
        </div>

        <div class="game-card live">
          <div class="top">
            <span>NBA · BALL ARENA</span>
            <span class="right">● Q4 4:21</span>
          </div>
          <div class="team-row">
            <div class="logo-tile">LAL</div>
            <div>
              <div class="team-name">Lakers</div>
              <div class="team-record">2-1</div>
            </div>
            <div class="pitcher">LeBron · 24 PTS</div>
            <div class="score">88</div>
          </div>
          <div class="team-row win">
            <div class="logo-tile">DEN</div>
            <div>
              <div class="team-name">Nuggets</div>
              <div class="team-record">1-2</div>
            </div>
            <div class="pitcher">Jokić · 31 PTS · TD</div>
            <div class="score">94</div>
          </div>
        </div>

        <div class="game-card">
          <div class="top">
            <span>BOXING · SAT 8PM ET</span>
            <span class="right">UPCOMING</span>
          </div>
          <div class="team-row">
            <div class="logo-tile">PR</div>
            <div>
              <div class="team-name">Teófimo López</div>
              <div class="team-record">21-1, 13 KO</div>
            </div>
            <div class="pitcher">+135</div>
            <div class="score">—</div>
          </div>
          <div class="team-row">
            <div class="logo-tile">MEX</div>
            <div>
              <div class="team-name">M. Berchelt</div>
              <div class="team-record">39-3, 35 KO</div>
            </div>
            <div class="pitcher">-150</div>
            <div class="score">—</div>
          </div>
        </div>

        <div class="game-card">
          <div class="top">
            <span>SOCCER · ESTADIO AZTECA</span>
            <span class="right">FT</span>
          </div>
          <div class="team-row lose">
            <div class="logo-tile">PR</div>
            <div>
              <div class="team-name">Puerto Rico</div>
              <div class="team-record">FRIENDLY</div>
            </div>
            <div class="pitcher"></div>
            <div class="score">2</div>
          </div>
          <div class="team-row win">
            <div class="logo-tile">MEX</div>
            <div>
              <div class="team-name">Mexico</div>
              <div class="team-record">FRIENDLY</div>
            </div>
            <div class="pitcher"></div>
            <div class="score">3</div>
          </div>
        </div>
      </div>

      <!-- Standings table -->
      <div class="standings-card">
        <div class="head">
          <h3>AL East Standings</h3>
          <div class="actions">
            <select class="sort-select">
              <option>AL East</option>
              <option>AL Central</option>
              <option>AL West</option>
              <option>NL East</option>
              <option>NL Central</option>
              <option>NL West</option>
            </select>
          </div>
        </div>
        <table>
          <thead>
            <tr>
              <th>#</th>
              <th>Team</th>
              <th class="num">W</th>
              <th class="num">L</th>
              <th class="num">PCT</th>
              <th class="num">GB</th>
              <th class="num">RUN ±</th>
              <th class="num">STRK</th>
              <th>Last 10</th>
            </tr>
          </thead>
          <tbody>
            <tr class="lead">
              <td>1</td>
              <td class="team-cell"><span class="mini-logo">NYY</span> New York Yankees</td>
              <td class="num">7</td>
              <td class="num">1</td>
              <td class="num">.875</td>
              <td class="num">—</td>
              <td class="num">+24</td>
              <td class="num">W4</td>
              <td><span class="form-dots"><span class="w">W</span><span class="w">W</span><span class="w">W</span><span class="w">W</span><span class="l">L</span><span class="w">W</span><span class="w">W</span><span class="w">W</span></span></td>
            </tr>
            <tr>
              <td>2</td>
              <td class="team-cell"><span class="mini-logo">BOS</span> Boston Red Sox</td>
              <td class="num">14</td>
              <td class="num">7</td>
              <td class="num">.667</td>
              <td class="num">2.0</td>
              <td class="num">+18</td>
              <td class="num">W2</td>
              <td><span class="form-dots"><span class="w">W</span><span class="l">L</span><span class="w">W</span><span class="w">W</span><span class="l">L</span><span class="w">W</span><span class="w">W</span><span class="l">L</span></span></td>
            </tr>
            <tr>
              <td>3</td>
              <td class="team-cell"><span class="mini-logo">TOR</span> Toronto Blue Jays</td>
              <td class="num">10</td>
              <td class="num">12</td>
              <td class="num">.455</td>
              <td class="num">5.0</td>
              <td class="num">-3</td>
              <td class="num">L1</td>
              <td><span class="form-dots"><span class="l">L</span><span class="w">W</span><span class="l">L</span><span class="l">L</span><span class="w">W</span><span class="l">L</span><span class="w">W</span><span class="l">L</span></span></td>
            </tr>
            <tr>
              <td>4</td>
              <td class="team-cell"><span class="mini-logo">TBR</span> Tampa Bay Rays</td>
              <td class="num">9</td>
              <td class="num">13</td>
              <td class="num">.409</td>
              <td class="num">6.0</td>
              <td class="num">-7</td>
              <td class="num">L2</td>
              <td><span class="form-dots"><span class="l">L</span><span class="l">L</span><span class="w">W</span><span class="l">L</span><span class="l">L</span><span class="w">W</span><span class="l">L</span><span class="w">W</span></span></td>
            </tr>
            <tr>
              <td>5</td>
              <td class="team-cell"><span class="mini-logo">BAL</span> Baltimore Orioles</td>
              <td class="num">8</td>
              <td class="num">14</td>
              <td class="num">.364</td>
              <td class="num">7.0</td>
              <td class="num">-12</td>
              <td class="num">W1</td>
              <td><span class="form-dots"><span class="w">W</span><span class="l">L</span><span class="l">L</span><span class="l">L</span><span class="w">W</span><span class="l">L</span><span class="l">L</span><span class="w">W</span></span></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- ==========================================
     PAGE: CATEGORY (e.g., MLB)
     ========================================== -->
<div class="page" id="page-category">
  <section class="cat-banner">
    <div class="frame">
      <div>
        <div class="label">Section</div>
        <h1>Major <em>League</em><br>Baseball</h1>
        <p>Daily coverage of MLB from a Latino lens — featuring beat reporting on the Yankees and Mets, Latin American prospects, and the storylines shaping the 2026 season.</p>
        <button class="btn-primary">Follow Section →</button>
      </div>
      <div class="cat-stats">
        <div class="cat-stat">
          <div class="lbl">Stories This Week</div>
          <div class="val">42</div>
        </div>
        <div class="cat-stat">
          <div class="lbl">Beat Writers</div>
          <div class="val">8</div>
        </div>
        <div class="cat-stat">
          <div class="lbl">Avg Read Time</div>
          <div class="val">4m</div>
        </div>
        <div class="cat-stat">
          <div class="lbl">Live Now</div>
          <div class="val">3</div>
        </div>
      </div>
    </div>
  </section>

  <div class="cat-toolbar">
    <div class="filter-row">
      <button class="filter-pill active">All MLB</button>
      <button class="filter-pill">Yankees</button>
      <button class="filter-pill">Mets</button>
      <button class="filter-pill">Marlins</button>
      <button class="filter-pill">Latin Prospects</button>
      <button class="filter-pill">Boxing</button>
      <button class="filter-pill">Photo Galleries</button>
    </div>
    <select class="sort-select">
      <option>Sort: Latest</option>
      <option>Sort: Most Read</option>
      <option>Sort: Most Shared</option>
    </select>
  </div>

  <section class="section" style="padding-top:0">
    <div class="stories-grid">
      <article class="story feature" data-route="article">
        <div class="thumb">
          <div class="badge-row"><span class="badge sport">FEATURED</span><span class="badge live">LIVE</span></div>
          <div class="duration">6 min</div>
        </div>
        <div class="body">
          <div class="category">Yankees · Game Story</div>
          <h3>The Comeback Yankees Are For Real — Bronx Bombers Erase Four-Run Deficit</h3>
          <div class="meta"><span class="author"><span class="avatar">RM</span> Rich Mancuso</span><span>·</span><span>1 hr ago</span><span>·</span><span>2.4k reading</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Yankees · Injury</div>
          <h3>Jasson Domínguez Exits With Bruised Elbow — X-Rays Negative</h3>
          <div class="meta"><span class="author"><span class="avatar">RM</span> Rich Mancuso</span><span>·</span><span>2 hr ago</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Mets · Analysis</div>
          <h3>Suárez's Power Surge Has the Mets Reconsidering the Lineup Order</h3>
          <div class="meta"><span class="author"><span class="avatar">RM</span> Rich Mancuso</span><span>·</span><span>Yesterday</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Yankees · Photo Gallery</div>
          <h3>Yankees Home Opener — In Pictures · Bill Menzel</h3>
          <div class="meta"><span class="author"><span class="avatar">BM</span> Bill Menzel</span><span>·</span><span>1 week ago</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Marlins</div>
          <h3>Marlins Activate Rookie Pitcher From IL Ahead of Series</h3>
          <div class="meta"><span class="author"><span class="avatar">PT</span> P. Torres</span><span>·</span><span>3 hr ago</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Latin Prospects</div>
          <h3>Top 10 Latin American Prospects to Watch in 2026</h3>
          <div class="meta"><span class="author"><span class="avatar">JS</span> J. Santos</span><span>·</span><span>2 days ago</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Yankees · Bullpen</div>
          <h3>Why the Bullpen Has Been the Real Story</h3>
          <div class="meta"><span class="author"><span class="avatar">JS</span> J. Santos</span><span>·</span><span>2 days ago</span></div>
        </div>
      </article>
      <article class="story" data-route="article">
        <div class="thumb"><div class="badge-row"><span class="badge sport">MLB</span></div></div>
        <div class="body">
          <div class="category">Five Things</div>
          <h3>Five Things We Learned From the Yankees' 7-1 Start</h3>
          <div class="meta"><span class="author"><span class="avatar">RM</span> Rich Mancuso</span><span>·</span><span>1 day ago</span></div>
        </div>
      </article>
    </div>
  </section>
</div>

<!-- ==========================================
     FOOTER
     ========================================== -->
<footer class="site">
  <div class="wrap">
    <div class="brand">
      <div class="logo">
        <div class="mark">L</div>
        <div>
          <div class="word">LATINO<span class="sport">SPORTS</span></div>
          <div class="tag">Latin Athletes · Latino Legends · Deportes</div>
        </div>
      </div>
      <p>The leading bilingual sports news network covering Latino athletes, Latino legends, and the stories the rest of the industry overlooks. Since 1990.</p>
      <div class="socials">
        <a href="#" aria-label="X">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>
        </a>
        <a href="#" aria-label="IG">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="20" x="2" y="2" rx="5"/><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/><line x1="17.5" x2="17.51" y1="6.5" y2="6.5"/></svg>
        </a>
        <a href="#" aria-label="FB">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M22.675 0H1.325C.593 0 0 .593 0 1.325v21.351C0 23.407.593 24 1.325 24H12.82v-9.294H9.692v-3.622h3.128V8.413c0-3.1 1.893-4.788 4.659-4.788 1.325 0 2.464.099 2.795.143v3.24h-1.918c-1.504 0-1.795.715-1.795 1.763v2.313h3.587l-.467 3.622h-3.12V24h6.116c.73 0 1.323-.593 1.323-1.325V1.325C24 .593 23.407 0 22.675 0z"/></svg>
        </a>
        <a href="#" aria-label="YT">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg>
        </a>
      </div>
    </div>
    <div>
      <h4>Sports</h4>
      <div class="links">
        <a href="#">MLB</a>
        <a href="#">NBA</a>
        <a href="#">NFL</a>
        <a href="#">Boxing</a>
        <a href="#">Soccer</a>
        <a href="#">College</a>
        <a href="#">Other Sports</a>
      </div>
    </div>
    <div>
      <h4>Network</h4>
      <div class="links">
        <a href="#">Pa Que Sepa</a>
        <a href="#">Latino Legends</a>
        <a href="#">YouTube Channel</a>
        <a href="#">Photo Galleries</a>
        <a href="#">Podcast</a>
        <a href="#">Newsletter</a>
      </div>
    </div>
    <div>
      <h4>Company</h4>
      <div class="links">
        <a href="#">About</a>
        <a href="#">Latino Sports Team</a>
        <a href="#">Contact</a>
        <a href="#">Advertise</a>
        <a href="#">Press</a>
        <a href="#">Privacy</a>
      </div>
    </div>
  </div>
  <div class="copy">
    <span>© 2026 Latino Sports Network. All rights reserved.</span>
    <span>Concept redesign · For demonstration purposes only</span>
  </div>
</footer>

<script>
  /* ==========================================
     IN-PAGE ROUTER
     ========================================== */
  const pages = document.querySelectorAll('.page');
  const navLinks = document.querySelectorAll('nav.primary a');

  function go(route) {
    pages.forEach(p => p.classList.remove('active'));
    const target = document.getElementById('page-' + route);
    if (target) target.classList.add('active');
    navLinks.forEach(a => {
      a.classList.toggle('active', a.dataset.route === route);
    });
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  document.querySelectorAll('[data-route]').forEach(el => {
    el.addEventListener('click', e => {
      const r = el.dataset.route;
      if (r) {
        e.preventDefault();
        go(r);
      }
    });
  });

  /* Filter pill toggle (visual only) */
  document.querySelectorAll('.filter-row, .section-head .actions').forEach(group => {
    group.addEventListener('click', e => {
      const btn = e.target.closest('.filter-pill');
      if (!btn) return;
      group.querySelectorAll('.filter-pill').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
    });
  });

  /* Date pill toggle */
  document.querySelectorAll('.date-pills').forEach(group => {
    group.addEventListener('click', e => {
      const btn = e.target.closest('.date-pill');
      if (!btn) return;
      group.querySelectorAll('.date-pill').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
    });
  });

  /* Language toggle */
  document.querySelectorAll('.lang').forEach(group => {
    group.addEventListener('click', e => {
      const btn = e.target.closest('button');
      if (!btn) return;
      group.querySelectorAll('button').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
    });
  });

  /* League rail toggle */
  document.querySelectorAll('.league-rail').forEach(group => {
    group.addEventListener('click', e => {
      const a = e.target.closest('a');
      if (!a) return;
      e.preventDefault();
      group.querySelectorAll('a').forEach(x => x.classList.remove('active'));
      a.classList.add('active');
    });
  });
</script>
</body>
</html>
