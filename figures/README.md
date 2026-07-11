# Figures

## Context

A poster is read at two distances. From far away, a figure should reveal the
shape of the result. Up close, its labels, values, and caption should let the
reader verify the claim. This folder holds the visual evidence that does that
work: plots, diagrams, photographs, maps, and exported tables.

It also holds two template assets:

- `cmu-tartan-source.png` is the complete tartan artwork embedded in the `.pptx`
  template provided during the English Enhancement Program at CMU-Africa;
- `cmu-tartan-stripe.png` is a horizontal crop of that artwork, tiled across the
  top and bottom of the A0 page.

The stripe was cropped for shape, not redrawn for color. Keep the source file
beside it so the provenance remains visible.

## Add a Figure

Place the file here, then include it from the relevant file under
`modules/sections/`:

```tex
\includegraphics[width=\linewidth]{figures/result-plot.pdf}
\captionof{figure}{The proposed method reduced error at every test site.}
```

The caption states what the reader should notice. (plain words: “Result by site”
names the picture; “error fell at every site” explains the result.)

## Choose the Right File

- Plots, diagrams, equations exported as artwork, and line drawings: vector PDF.
- Photographs: 300 ppi at the final printed dimensions.
- Images with transparency: high-resolution PNG when vector PDF is unavailable.
- Screenshots: avoid them for plots, tables, logos, and text.

If You’re Stuck. Decide the final printed width first. Multiply that width in
inches by 300; the result is the minimum preferred pixel width for a photograph.
A 10-inch photograph should therefore be about 3000 pixels wide.

## Before Printing

Check that labels can be read at poster distance, colors remain distinct in
grayscale, axes include units, photographs have permission and releases, and the
caption can stand on its own. Open the final PDF at 100%; do not judge image
quality only from the LaTeX preview window.

## References

1. Carnegie Mellon University, [Color Standards](https://brand.cmu.edu/visual-identity/colors).
2. Carnegie Mellon University, [Typeface Standards](https://brand.cmu.edu/visual-identity/typefaces).
3. The PowerPoint (`.pptx`) version of the poster template provided to us during
   the English Enhancement Program at CMU-Africa; source of the tartan artwork.
