# Prompt 02: Build The Saga Site

Use this after you have a site brief and your assets are in `content/static/assets/`.

```text
If required details are missing or ambiguous, ask me concise questions before making changes.

I want you to build an app landing page in this Swift Saga static site template.

Before editing:
1. Inspect `README.md`, `Package.swift`, `Sources/`, `content/`, and `content/static/`.
2. Confirm where the homepage content, Swift templates, CSS, and static assets live.
3. If my app brief, asset paths, CTA URL, or privacy/support/contact information are missing, ask me questions before making changes.

Use this site brief:

---
Solaced — Landing Page Brief

One-Sentence Positioning

▎ Solaced is the pocket companion that gives teachers a space to vent, find perspective, and remember that what they do every day is worth something.

---
Recommended Headline & Subheadline

Headline:

▎ You give everything to your class. Solaced gives something back to you.

Subheadline:

▎ Dump your after-class thoughts, receive a warm response, and find real stories from teachers who get it — all in a private space built just for you.

Rationale: "give everything / gives back" mirrors the emotional transaction teachers experience daily without sounding preachy or motivational-poster-y. It positions Solaced as reciprocal — not corrective.

---
Suggested Page Sections

1. Hero
- App icon (centered or inline), headline + subheadline
- Primary CTA: Test the app! → https://testflight.apple.com/join/PKC2gCm3
- TestFlight badge or plain link (no App Store badge — it's in beta)
- Background: #FCFDFF with subtle purple/orange accent gradient, matching the app icon's warmth
- Phone mockup displaying screenshot-home.png

2. Empathy Bridge (no header — just 2–3 lines of honest copy)

▎ Teaching doesn't clock out when you do. The frustrations, the wins nobody claps for, the days you wonder if it's worth it — Solaced is built for all of that.

No statistics, no bullet points. Just truth. This sets emotional context before pitching features.

3. Three Features (card row)

┌─────────┬───────────────────────────────────────────────────────────┬─────────────────────────┐
│ Feature │                          Heading                          │       Screenshot        │
├─────────┼───────────────────────────────────────────────────────────┼─────────────────────────┤
│ Remind  │ "On the hard days, we'll remind you why you started"      │ screenshot-home.png     │
├─────────┼───────────────────────────────────────────────────────────┼─────────────────────────┤
│ Dump    │ "Say it. All of it. Your thoughts stay yours."            │ screenshot-talk.png     │
├─────────┼───────────────────────────────────────────────────────────┼─────────────────────────┤
│ Inspire │ "Stories from teachers who've been exactly where you are" │ screenshot-response.png │
└─────────┴───────────────────────────────────────────────────────────┴─────────────────────────┘

Each card: feature screenshot (phone frame optional), short bold heading, one sentence of copy.

4. How It Works (3 steps)
1. Open the app and tap the chat
2. Share what's on your mind — voice or text
3. Receive a warm response and curated teacher stories

Simple, no jargon, no onboarding screenshots needed here.

5. Beta Notice Banner

▎ Solaced is currently in beta. We'd love your honest feedback — the good, the hard, all of it.
▎ Test it on TestFlight →

Honest tone, not desperate. Treat beta testers as collaborators, not guinea pigs.

6. FAQ
All 7 questions from your brief — rendered as a clean static list (no JS accordion needed). Key ones to lead with:
- What is Solaced?
- Is what I write in the app private?
- Is Solaced only for struggling teachers?

7. Footer
- Privacy Policy link (/privacy-policy)
- Support: nilcamprubi@icloud.com
- "Built with Saga"

---
Visual Direction

- Palette: Use the app's own colors exactly.
  - Background: #FCFDFF (light mode)
  - Primary accent: #5B23B5 (buttons, bold emphasis, links)
  - Secondary accent: #E64900 (warm highlights, icon borders)
  - Dark mode ready with #080823 + #B6B8FC + #FF834A
- Type emphasis: Mirror the app — bold purple and orange on key words in headlines (e.g., "Teachers" in #5B23B5, "deserve" in #E64900)
- Mascot: The orange blob mascot from the app should appear in the empathy section or alongside the "Dump" feature — it's Solaced's most distinctive visual asset and sets it apart instantly
- Feeling: Warm, light, slightly playful — never corporate, never clinical, never "your one-stop wellness solution"

---
Assets to Use

┌───────────────────────────────────────────────┬────────────────────────────────────────┐
│                     File                      │                 Where                  │
├───────────────────────────────────────────────┼────────────────────────────────────────┤
│ content/static/assets/app-icon.png            │ Hero (favicon, nav logo, hero display) │
├───────────────────────────────────────────────┼────────────────────────────────────────┤
│ content/static/assets/screenshot-home.png     │ Hero mockup + "Remind" feature card    │
├───────────────────────────────────────────────┼────────────────────────────────────────┤
│ content/static/assets/screenshot-talk.png     │ "Dump" feature card                    │
├───────────────────────────────────────────────┼────────────────────────────────────────┤
│ content/static/assets/screenshot-response.png │ "Inspire" feature card                 │
└───────────────────────────────────────────────┴────────────────────────────────────────┘

---
Missing Items to Provide Before Implementation

Needed (blocking):
- Privacy policy text — the current content/privacy-policy.md is placeholder copy. You'll need real policy content before publishing, especially since Solaced handles personal thought entries. A simple "we don't collect or store your data" statement is fine if accurate.

Useful (not blocking):
- A testimonial or two — even one beta tester quote would make the page significantly more credible. A quote from a teacher friend counts.
- Favicon — can be auto-derived from app-icon.png at 32px, but confirm you want that.
- Social links — if any exist (Twitter/X, Instagram, etc.)

Nice to have later:
- A short demo video or GIF of the mascot/chat interaction — this page would come alive with motion

---

Implementation requirements:
- Build a polished single-page app website.
- Keep editable marketing copy in Markdown where practical.
- Use Swift templates only for structure, reusable layout, metadata, and components that are awkward in Markdown.
- Use assets from `content/static/assets/`.
- Reference assets with public paths like `/static/assets/screenshot-home.png`.
- Include these sections when enough information is available:
  - Hero with app name, headline, subheadline, primary CTA, and app visual.
  - Benefits or features.
  - Screenshots or product preview.
  - App Store or TestFlight CTA.
  - FAQ.
  - Privacy/support/contact links.
- Include SEO title, meta description, and social sharing metadata if the template supports it. If it does not support these yet, ask before adding that capability.
- Make the page responsive for mobile and desktop.
- Avoid placeholder text unless you clearly mark it as TODO.
- Do not edit generated files in `deploy/` directly.

Style requirements:
- Use a visual direction that fits the app and audience.
- Avoid generic AI-looking purple gradient landing pages unless my brief explicitly asks for that.
- Keep text readable and buttons easy to tap on mobile.
- Do not use assets outside the repository unless I approve them.

Be sure to use skills as necessary for the following
- Frontend Design Skill
- Copywriting Skill
- Saga site building skill

After editing:
- Tell me which files changed.
- Tell me what command to run to preview the site.
- Tell me what to check in the browser.
```
