# penguinscope

An interactive data product for exploring the Palmer Penguins dataset.
`penguinscope` bundles a cleaned penguins dataset, a summary function, and a
Shiny app that lets you compare the body measurements of the three penguin
species across islands and sex.

**For:** someone new to the Palmer Penguins data who wants to see how the three
species differ in size.

**Question:** How do penguin body measurements differ across species, and does
that depend on the island or the penguin's sex?

## Data

The package includes `penguins`, a cleaned subset of the Palmer Penguins
dataset: 333 penguins measured on three islands in the Palmer Archipelago,
Antarctica. Source: the **palmerpenguins** R package (Horst, Hill & Gorman,
2020), with data collected by Dr Kristen Gorman and the Palmer Station LTER
(licence: CC0). The preparation script is in `data-raw/penguins.R`.

## Installation

```r
# install.packages("remotes")
remotes::install_github("ETC5523-2026/etc5523-assignment-4-dhanorkartushar2au-lgtm")
```

## Launch the app

```r
library(penguinscope)
launch_app()
```

You can also use the summary function directly:

```r
summarise_penguins(penguins, "body_mass_g")
```

## Documentation

Full documentation and a usage vignette are on the package website:
<https://etc5523-2026.github.io/etc5523-assignment-4-dhanorkartushar2au-lgtm/>

## Generative AI declaration
I used Claude (Anthropic) to help plan the package, write and debug the R code,
and draft the documentation. I checked and revised all generated code and text,
and I take responsibility for the final submission.