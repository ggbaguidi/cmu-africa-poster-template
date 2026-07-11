# Logos

## Context

This folder holds identity marks: CMU-Africa, partner universities, research
institutes, funders, and sponsors. A logo is not ordinary decoration. It carries
ownership, approval, and a set of rules that belong to the institution that made
it.

`cmu-africa-wordmark.png` was extracted unchanged from a PowerPoint (`.pptx`)
version of the poster template provided to us during the English Enhancement
Program at CMU-Africa. The poster includes it proportionally at the upper left.

## Add a Logo

Place the approved file in this folder, then register it in `main.tex`:

```tex
\AddInstitutionLogo{logos/partner-university.pdf}
```

Add one line per institution. The template counts the logos and distributes them
in the reserved row automatically. For an unusually wide mark:

```tex
\AddInstitutionLogo[50mm]{logos/wide-funder.pdf}
```

(plain words: add files here; add commands in `main.tex`; let `branding.tex` do
the arithmetic.)

## Rules

- Use an official file supplied by the institution or its communications team.
- Prefer vector PDF; use a high-resolution transparent PNG when vector artwork
  is not available.
- Do not crop, recolor, stretch, trace, rebuild, or separate parts of a mark.
- Keep the required clear space around the complete artwork.
- Confirm co-branding order and approval before external printing.
- Replace every labelled “Missing logo” box before release.

If You’re Stuck. Ask the logo owner for a print-ready vector file and its
clear-space guidance. A screenshot from a website is not a print asset.

## References

1. Carnegie Mellon University, [University Logo: Sizing, Placement, and Use](https://brand.cmu.edu/visual-identity/carnegie-mellon-trademarks/university-logo).
2. Carnegie Mellon University, [Official Brand Downloads](https://brand.cmu.edu/resources/downloads).
3. Carnegie Mellon University Africa, [CMU-Africa official site](https://www.africa.engineering.cmu.edu/).
