# CMU-Africa A0 Research Poster

## Context

An academic poster has one job: help a person understand the research before
they decide whether to stop and read the details. The template therefore keeps
the structure quiet. It gives the title room, separates the argument into three
columns, and leaves figures and results to carry the visual weight.

The design follows a PowerPoint (`.pptx`) version of the poster template provided
to us during the English Enhancement Program at CMU-Africa. The CMU-Africa
wordmark sits at the upper left, a narrow tartan band runs across the top and
bottom, and two thin rules divide the page into three working areas. The default
page is international A0 landscape, 1189 × 841 mm. Portrait A0 is also supported.

(plain words: `main.tex` holds the poster; `branding.tex` holds the rules that
keep the poster looking like one system.)

## What the Template Gives You

- exact A0 portrait and landscape pages;
- a centered title, author, affiliation, and contact block;
- three columns that stay aligned while the content changes;
- reusable section and subsection headings;
- figures, photographs, tables, equations, numbered citations, and captions;
- an automatic row for institution, partner, and sponsor logos;
- Open Sans text and an embedded mathematics font;
- the CMU-Africa wordmark and tartan artwork extracted from that `.pptx` template;
- one-command builds and checks that remain ordinary LaTeX, not a custom poster
  application.

## The Pieces to Keep Beside You

```text
.
├── main.tex                         poster metadata, logos, and content
├── branding.tex                     page, type, color, spacing, and layout rules
├── references.bib                   numbered BibTeX references
├── Makefile                         landscape, portrait, and cleanup commands
├── logos/
│   └── cmu-africa-wordmark.png      extracted unchanged from the template
└── figures/
    ├── cmu-tartan-source.png        complete embedded tartan artwork
    └── cmu-tartan-stripe.png        horizontal crop used for the page bands
```

## Progression and Rationale

Build the poster in five passes. Each pass settles one kind of decision before
the next one begins.

| Pass | What it settles |
|---|---|
| Pass 1 | Identity: title, authors, affiliations, contact, and institutions. |
| Pass 2 | Story: background → solution → results → what comes next. |
| Pass 3 | Evidence: figures, tables, equations, captions, and references. |
| Pass 4 | Balance: text density, spacing, logo scale, and column alignment. |
| Pass 5 | Production: page size, embedded fonts, image quality, and printer requirements. |

Take the passes in order. It is easier to shorten a paragraph after the story is
clear than to repair a crowded page at the printer.

## Pass 1: Name the Work

Edit the metadata near the top of `main.tex`:

```tex
\PosterTitle{A Clear, Specific Research Title}
\PosterAuthors{First Author\textsuperscript{1} \quad Second Author\textsuperscript{2}}
\PosterAffiliations{%
  \textsuperscript{1}Carnegie Mellon University Africa, Kigali, Rwanda\\
  \textsuperscript{2}Partner University, City, Country}
\PosterContact{author@andrew.cmu.edu}
```

Keep the title short enough to read in one breath. Use affiliations to explain
the superscripts; do not make the reader decode them.

### Add Institution Logos

Add one command for every approved institution, partner, or sponsor mark:

```tex
\AddInstitutionLogo{logos/university-a.pdf}
\AddInstitutionLogo{logos/university-b.pdf}
\AddInstitutionLogo{logos/funder.pdf}
```

The template counts the commands, computes the available width, inserts a
consistent gap, and preserves each aspect ratio. The row is reserved beneath the
affiliations, so adding a fourth logo does not push the title or the columns.

(plain words: you tell the template which logos exist; the template does the
spacing.)

No separate count is required. `\InstitutionLogoCount` expands to the current
number of registered logos. Automatic sizing is intended for one to six marks.
If one logo has unusual proportions, give that logo an explicit width:

```tex
\AddInstitutionLogo[50mm]{logos/very-wide-sponsor.pdf}
```

The row itself can be tuned when a project needs it:

```tex
\SetInstitutionLogoRowWidth{520mm}
\SetInstitutionLogoGap{12mm}
\SetInstitutionLogoMaxSize{72mm}{23mm}
```

`\ClearInstitutionLogos` empties the row. A missing file produces a labelled
draft box rather than stopping compilation; replace that box before printing.

## Pass 2: Build the Story

`\SimplePosterColumns` takes three arguments: left column, middle column, right
column. The demonstration uses this progression:

1. **Background:** what problem exists, why it matters, and what the work asks.
2. **Our Solution:** what was designed, measured, or tested, and how.
3. **Results:** what changed, what remains uncertain, and what should happen next.

Use `\PosterSection{...}` for the main turns in the story and
`\PosterSubsection{...}` for supporting ideas. Keep an ordinary section near
80–120 words and a list near three to five bullets.

If You’re Stuck. Write one sentence for each of these: the problem, the method,
the strongest result, the limitation, and the conclusion. Put those five
sentences on the page first. Add evidence only where it helps one of them.

## Pass 3: Add the Evidence

Replace the drafting box with a real figure:

```tex
\includegraphics[width=\linewidth]{figures/result-plot.pdf}
\captionof{figure}{State the result the reader should notice.}
```

Use vector PDF for plots, diagrams, and line art. Use photographs at 300 ppi at
their final printed size. (plain words: a 300 ppi image that is enlarged to twice
its intended width becomes a 150 ppi image.)

Tables should carry values that need to be read exactly. Equations should carry
relationships that are easier to see symbolically than in prose. Captions should
explain the claim, not merely name the object.

Numbered references come from `references.bib` through BibTeX:

```tex
Prior work motivates this evaluation \cite{guo2017calibration}.
```

## Pass 4: Balance the Page

The defaults are a starting point, not a requirement to fill every centimetre.
White space separates ideas and gives the reader a path through the poster.

- Title: 60–84 pt.
- Section headings: 32–44 pt.
- Body: 24–32 pt.
- Captions and references: at least 18–22 pt.
- Photographs: 300 ppi preferred at final size.
- Logos and diagrams: vector PDF preferred.
- Bullets: three to five per section.
- Text: roughly 600–900 body words for the complete A0 poster.

Do not crop, recolor, stretch, trace, or rebuild institutional logos. The current
logo commands always preserve aspect ratio and cap height. Keep the official
clear space around each mark even when the computed row could fit something
larger.

## Pass 5: Compile and Check

Use LuaLaTeX. It loads OpenType fonts directly and embeds Open Sans and the
mathematics font in the PDF.

```sh
make             # main.pdf: default landscape A0
make landscape   # main-landscape.pdf
make portrait    # main-portrait.pdf
```

The manual sequence is:

```sh
lualatex main.tex
bibtex main
lualatex main.tex
lualatex main.tex
```

Then verify the object you are about to print:

```sh
pdfinfo main.pdf
pdffonts main.pdf
```

`pdfinfo` should report one A0 page. `pdffonts` should report `yes` under the
embedded-font column. Inspect the PDF at 100%, scan the QR code from a printed
proof, and confirm that no draft logo boxes remain.

Ask the printer whether the job requires an ICC profile, PDF/X conversion,
bleed, or crop marks. Those are properties of the press workflow; guessing them
inside a general template can make a correct PDF less correct.

## Brand Logic

The template uses Carnegie Red `#C41230`, black `#000000`, Iron Gray `#6D6E71`,
Steel Gray `#E0E0E0`, and white. CMU identifies these as the core palette and
states that Carnegie Red should remain prominent. Open Sans is the primary sans
serif; Helvetica is the stated fallback when Open Sans is unavailable.

The official University Logo guidance gives a minimum print width of 0.75 inch
(19.05 mm), requires a one-“M” safe zone, and says to scale the complete artwork
proportionally. This project applies the same practical discipline to every mark:
use an approved file, preserve its proportions, and give it room.

The CMU-Africa wordmark is used exactly as it was embedded in the `.pptx`
template provided during the English Enhancement Program at CMU-Africa. It is
not cropped, recolored, traced, or reconstructed. The tartan source is preserved;
the narrow stripe is a horizontal crop of that source for the page border.

Before external publication, confirm the final logo set and co-branding order
with the relevant CMU, CMU-Africa, partner, and funder communications teams.

## References and Provenance

1. Carnegie Mellon University, [Color Standards](https://brand.cmu.edu/visual-identity/colors).
2. Carnegie Mellon University, [Typeface Standards](https://brand.cmu.edu/visual-identity/typefaces).
3. Carnegie Mellon University, [University Logo: Sizing, Placement, and Use](https://brand.cmu.edu/visual-identity/carnegie-mellon-trademarks/university-logo).
4. Carnegie Mellon University, [Official Brand Downloads](https://brand.cmu.edu/resources/downloads).
5. Carnegie Mellon University Africa, [CMU-Africa official site](https://www.africa.engineering.cmu.edu/).
6. The PowerPoint (`.pptx`) version of the poster template provided to us during
   the English Enhancement Program at CMU-Africa; source of the embedded
   CMU-Africa wordmark and tartan artwork.
